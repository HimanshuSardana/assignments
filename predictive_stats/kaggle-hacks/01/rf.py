import pandas as pd
from sklearn.decomposition import PCA
from sklearn.model_selection import StratifiedKFold, GridSearchCV
from sklearn.preprocessing import RobustScaler
from sklearn.feature_selection import SelectKBest, f_classif
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier, VotingClassifier

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
# 3️⃣ Scaling
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

# ===============================
# 6️⃣ Define Models
# ===============================
knn = KNeighborsClassifier(n_jobs=-1)
rf = RandomForestClassifier(
    n_estimators=300,
    max_depth=None,
    min_samples_split=5,
    min_samples_leaf=2,
    random_state=69,
    n_jobs=-1,
)

# ===============================
# 7️⃣ Voting Ensemble
# ===============================
ensemble = VotingClassifier(
    estimators=[("knn", knn), ("rf", rf)],
    voting="soft",  # use 'soft' for probabilistic averaging
    n_jobs=-1,
)

# ===============================
# 8️⃣ Grid Search for KNN
# ===============================
param_grid = {
    "knn__n_neighbors": [3, 5, 7, 9],
    "knn__weights": ["distance"],
    "knn__metric": ["cosine", "manhattan"],
}

kf = StratifiedKFold(n_splits=5, shuffle=True, random_state=69)

grid_search = GridSearchCV(
    estimator=ensemble,
    param_grid=param_grid,
    cv=kf,
    scoring="balanced_accuracy",
    n_jobs=-1,
    verbose=2,
)

print("Starting Grid Search on Ensemble...")
grid_search.fit(X_pca, y)

print(f"Best Parameters: {grid_search.best_params_}")
print(f"Best CV Balanced Accuracy: {grid_search.best_score_:.4f}")

# ===============================
# 9️⃣ Final Prediction
# ===============================
final_model = grid_search.best_estimator_
predictions = final_model.predict(X_test_pca)

submission = pd.DataFrame({"id": test_ids, "target": predictions})
submission.to_csv("submission_knn_rf_ensemble.csv", index=False)
print("Submission saved as submission_knn_rf_ensemble.csv")
