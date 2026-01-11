import pandas as pd
from sklearn.model_selection import StratifiedKFold, GridSearchCV
from sklearn.preprocessing import RobustScaler, PowerTransformer
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA
from sklearn.neighbors import KNeighborsClassifier
from sklearn.pipeline import Pipeline

# ===============================
# 1️⃣ Load & Clean
# ===============================
train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

y = train["target"].astype(int)
X = train.drop(columns=["id", "target"])
X_test = test.drop(columns=["id"])

# Remove constant/duplicate columns efficiently
X = X.loc[:, X.nunique() > 1]
X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

# ===============================
# 2️⃣ The Optimized Pipeline
# ===============================
# PowerTransformer (Yeo-Johnson) often helps KNN by making distributions
# more Gaussian-like, which improves distance calculations.
pipeline = Pipeline([
    ("scaler", RobustScaler()),
    ("gaussian", PowerTransformer()),
    ("lda", LDA()),  # Reduces to n_classes - 1 components
    ("knn", KNeighborsClassifier(n_jobs=-1)),
])

# ===============================
# 3️⃣ Grid Search with Distance Calibration
# ===============================
# Since we use LDA, n_components is limited.
# If LDA isn't enough, we can switch back to PCA in the param_grid.
param_grid = {
    "knn__n_neighbors": [5, 10, 15, 20, 30],
    "knn__weights": ["distance"],
    "knn__p": [1, 2],  # 1: Manhattan, 2: Euclidean
    "knn__metric": ["minkowski", "cosine"],
}

kf = StratifiedKFold(n_splits=5, shuffle=True, random_state=69)

grid_search = GridSearchCV(
    pipeline,
    param_grid=param_grid,
    cv=kf,
    scoring="balanced_accuracy",
    n_jobs=-1,
    verbose=2,
)

print("Starting Optimized Search...")
grid_search.fit(X, y)

print(f"Best Score: {grid_search.best_score_:.4f}")
print(f"Best Params: {grid_search.best_params_}")

# ===============================
# 4️⃣ Final Submission
# ===============================
submission = pd.DataFrame({"id": test["id"], "target": grid_search.predict(X_test)})
submission.to_csv("submission_optimized_knn.csv", index=False)
