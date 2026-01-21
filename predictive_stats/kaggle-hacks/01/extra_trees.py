import pandas as pd

from sklearn.preprocessing import RobustScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import StratifiedKFold, cross_val_predict, cross_val_score

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

y = train["target"].astype(int)
X = train.drop(columns=["id", "target"])

test_ids = test["id"]
X_test = test.drop(columns=["id"])

X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

scaler = RobustScaler()
X_scaled = scaler.fit_transform(X)
X_test_scaled = scaler.transform(X_test)

knn = KNeighborsClassifier(
    n_neighbors=15, weights="distance", metric="cosine", n_jobs=-1
)

cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

print("Generating KNN OOF predictions...")

knn_oof = cross_val_predict(knn, X_scaled, y, cv=cv, method="predict_proba", n_jobs=-1)

print("OOF shape:", knn_oof.shape)  # (n_samples, n_classes)

meta = LogisticRegression(
    max_iter=3000, C=2.0, class_weight="balanced", n_jobs=-1, multi_class="auto"
)

scores = cross_val_score(meta, knn_oof, y, cv=cv, scoring="accuracy")

print(f"Stacked CV Accuracy: {scores.mean():.4f}")

print("Training final models...")

knn.fit(X_scaled, y)
test_knn_proba = knn.predict_proba(X_test_scaled)

meta.fit(knn_oof, y)
final_preds = meta.predict(test_knn_proba)

submission = pd.DataFrame({"id": test_ids, "target": final_preds})

submission.to_csv("submission_knn_stack.csv", index=False)

print("Submission saved as submission_knn_stack.csv")
