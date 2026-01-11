import pandas as pd
from sklearn.decomposition import PCA
from sklearn.model_selection import StratifiedKFold, GridSearchCV
from sklearn.preprocessing import RobustScaler
from sklearn.feature_selection import SelectKBest, f_classif
from sklearn.svm import SVC

# ===============================
# 1️⃣ Load Data
# ===============================
train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

y = train["target"].astype(int)
X = train.drop(columns=["id", "target"])

test_ids = test["id"]
X_test = test.drop(columns=["id"])

# ===============================
# 2️⃣ Remove Duplicate Columns
# ===============================
X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

# ===============================
# 3️⃣ Robust Scaling
# ===============================
scaler = RobustScaler()
X_scaled = scaler.fit_transform(X)
X_test_scaled = scaler.transform(X_test)

# ===============================
# 4️⃣ Feature Selection
# ===============================
selector = SelectKBest(score_func=f_classif, k=30)
X_selected = selector.fit_transform(X_scaled, y)
X_test_selected = selector.transform(X_test_scaled)

print(f"Features reduced from {X.shape[1]} to {X_selected.shape[1]}")

# ===============================
# 5️⃣ PCA
# ===============================
pca = PCA(n_components=0.99, random_state=69)
X_pca = pca.fit_transform(X_selected)
X_test_pca = pca.transform(X_test_selected)

print(f"PCA reduced to {X_pca.shape[1]} components")

param_grid = {
    "C": [0.1, 1, 3, 10],
    "kernel": ["rbf", "poly", "linear"],
    "gamma": ["scale", "auto"],
}

cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

svm_search = GridSearchCV(
    estimator=SVC(
        probability=False,
        decision_function_shape="ovr",
        class_weight="balanced",
    ),
    param_grid=param_grid,
    cv=cv,
    scoring="accuracy",
    n_jobs=-1,
    verbose=2,
)

print("Starting SVM Grid Search...")
svm_search.fit(X_pca, y)

print(f"Best Parameters: {svm_search.best_params_}")
print(f"Best CV Accuracy: {svm_search.best_score_:.4f}")

# ===============================
# 7️⃣ Train Final Model
# ===============================
final_model = svm_search.best_estimator_
predictions = final_model.predict(X_test_pca)

submission = pd.DataFrame({"id": test_ids, "target": predictions})

submission.to_csv("submission_svm.csv", index=False)

print("Submission saved as submission_svm.csv")
