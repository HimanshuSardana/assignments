import pandas as pd

from sklearn.model_selection import StratifiedKFold, cross_val_score
from sklearn.preprocessing import RobustScaler, Normalizer
from sklearn.feature_selection import SelectKBest, f_classif
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import ExtraTreesClassifier, VotingClassifier
from sklearn.pipeline import Pipeline

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

y = train["target"].astype(int)
X = train.drop(columns=["id", "target"])

test_ids = test["id"]
X_test = test.drop(columns=["id"])

X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

knn_pipeline = Pipeline([
    ("scaler", RobustScaler()),
    ("normalizer", Normalizer(norm="l2")),
    ("select", SelectKBest(score_func=f_classif, k=30)),
    (
        "knn",
        KNeighborsClassifier(
            n_neighbors=50,
            weights="distance",
            metric="cosine",
            algorithm="brute",
            n_jobs=-1,
        ),
    ),
])

extratrees = ExtraTreesClassifier(
    n_estimators=1000,
    max_depth=None,
    min_samples_leaf=2,
    max_features="sqrt",
    class_weight="balanced",
    n_jobs=-1,
    random_state=42,
)

ensemble = VotingClassifier(
    estimators=[
        ("knn", knn_pipeline),
        ("et", extratrees),
    ],
    voting="soft",
    weights=[1, 3],  # trees dominate
    n_jobs=-1,
)

kf = StratifiedKFold(n_splits=8, shuffle=True, random_state=42)

cv_scores = cross_val_score(ensemble, X, y, cv=kf, scoring="accuracy", n_jobs=-1)

print(f"Ensemble CV Accuracy: {cv_scores.mean():.4f}")

ensemble.fit(X, y)

predictions = ensemble.predict(X_test)

submission = pd.DataFrame({"id": test_ids, "target": predictions})

submission.to_csv("submission_knn_extratrees.csv", index=False)
print("Submission saved as submission_knn_extratrees.csv")
