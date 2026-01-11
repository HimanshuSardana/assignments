import pandas as pd
from sklearn.preprocessing import StandardScaler

from sklearn.model_selection import StratifiedKFold, GridSearchCV
from sklearn.feature_selection import SelectKBest, f_classif
from sklearn.neighbors import KNeighborsClassifier

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

y = train["target"].astype(int)
X = train.drop(columns=["id", "target"])

test_ids = test["id"]
X_test = test.drop(columns=["id"])

X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
X_test_scaled = scaler.transform(X_test)

selector = SelectKBest(score_func=f_classif, k=50)
X_selected = selector.fit_transform(X_scaled, y)
X_test_selected = selector.transform(X_test_scaled)

print(f"Features reduced from {X.shape[1]} to {X_selected.shape[1]}")

# pca = PCA(n_components=0.98, random_state=42)
# X_pca = pca.fit_transform(X_selected)
# X_test_pca = pca.transform(X_test_selected)

X_pca = X_selected
X_test_pca = X_test_selected

print(f"PCA reduced to {X_pca.shape[1]} components")

param_grid = {
    "n_neighbors": [1, 3, 5, 7, 9, 11, 15],
    "weights": ["distance"],
    "metric": ["euclidean", "manhattan"],
}

kf = StratifiedKFold(n_splits=56, shuffle=True, random_state=42)

knn_search = GridSearchCV(
    estimator=KNeighborsClassifier(n_jobs=-1),
    param_grid=param_grid,
    cv=kf,
    scoring="accuracy",
    n_jobs=-1,
    verbose=1,
)

print("Starting Grid Search...")
knn_search.fit(X_pca, y)

print(f"Best Parameters: {knn_search.best_params_}")
print(f"Best CV F1-macro: {knn_search.best_score_:.4f}")

final_model = knn_search.best_estimator_
predictions = final_model.predict(X_test_pca)

submission = pd.DataFrame({"id": test_ids, "target": predictions})

submission.to_csv("submission_knn_pca.csv", index=False)
