import pandas as pd
import numpy as np
from sklearn.model_selection import StratifiedKFold
from sklearn.preprocessing import RobustScaler
from sklearn.feature_selection import SelectKBest, f_classif
from sklearn.neighbors import KNeighborsClassifier
from xgboost import XGBClassifier
from sklearn.ensemble import VotingClassifier
from imblearn.over_sampling import SMOTE
from imblearn.pipeline import Pipeline as ImbPipeline

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

y = train["target"].astype(int)
y_shifted = y - 1

X = train.drop(columns=["id", "target"])
X_test = test.drop(columns=["id"])

X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

scaler = RobustScaler()
X_scaled = scaler.fit_transform(X)
X_test_scaled = scaler.transform(X_test)

selector = SelectKBest(score_func=f_classif, k=32)
X_selected = selector.fit_transform(X_scaled, y_shifted)
X_test_selected = selector.transform(X_test_scaled)

knn_model = KNeighborsClassifier(
    n_neighbors=27, weights="distance", metric="cosine", n_jobs=-1
)

xgb_model = XGBClassifier(
    n_estimators=500,
    learning_rate=0.05,
    max_depth=6,
    objective="multi:softprob",
    num_class=19,
    random_state=42,
    tree_method="hist",  # Faster training
    n_jobs=-1,
)

ensemble = VotingClassifier(
    estimators=[("knn", knn_model), ("xgb", xgb_model)],
    voting="soft",
    weights=[1, 2],  # Giving XGBoost more weight usually helps
)

print("Training Ensemble (KNN + XGBoost) with SMOTE...")
pipeline = ImbPipeline([("smote", SMOTE(random_state=42)), ("ensemble", ensemble)])

kf = StratifiedKFold(n_splits=5, shuffle=True, random_state=69)
from sklearn.model_selection import cross_val_score

cv_scores = cross_val_score(pipeline, X_selected, y_shifted, cv=kf, scoring="accuracy")

print(f"Mean Ensemble CV Accuracy: {np.mean(cv_scores):.4f}")

pipeline.fit(X_selected, y_shifted)
predictions = pipeline.predict(X_test_selected)

final_predictions = predictions + 1

submission = pd.DataFrame({"id": test["id"], "target": final_predictions})
submission.to_csv("submission_ensemble_xgb_knn.csv", index=False)
print("Ensemble Submission saved!")
