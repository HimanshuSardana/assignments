import numpy as np
import pandas as pd
import warnings
from sklearn.model_selection import StratifiedKFold
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.decomposition import PCA
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

warnings.filterwarnings("ignore")

print("Loading Data...")
train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

# remove ID and target columns
X = train.drop(columns=["id", "target"])
X = X.loc[:, ~X.T.duplicated()]
print(f"Features after removing duplicates: {X.shape[1]}")
y = train["target"]
X_test_base = test.drop(columns=["id"])

le = LabelEncoder()
y_enc = le.fit_transform(y)
num_classes = len(np.unique(y_enc))

folds = 26
skf = StratifiedKFold(n_splits=folds, shuffle=True, random_state=42)

configs = [
    {"pca": 20, "k": 40, "metric": "cosine"},
    {"pca": 20, "k": 28, "metric": "cosine"},
    {"pca": 20, "k": 30, "metric": "cosine"},
    {"pca": 20, "k": 32, "metric": "cosine"},
    {"pca": 15, "k": 32, "metric": "cosine"},
    {"pca": 20, "k": 50, "metric": "cosine"},
    {"pca": 20, "k": 60, "metric": "cosine"},
    {"pca": 15, "k": 40, "metric": "cosine"},
    {"pca": 25, "k": 40, "metric": "cosine"},
    {"pca": 18, "k": 45, "metric": "cosine"},
    {"pca": 22, "k": 35, "metric": "cosine"},
    {"pca": 20, "k": 40, "metric": "manhattan"},
    {"pca": 20, "k": 30, "metric": "manhattan"},
    {"pca": 25, "k": 50, "metric": "manhattan"},
    {"pca": 15, "k": 60, "metric": "manhattan"},
    {"pca": 18, "k": 45, "metric": "manhattan"},
    {"pca": 22, "k": 35, "metric": "manhattan"},
    {"pca": 20, "k": 28, "metric": "manhattan"},
    {"pca": 20, "k": 32, "metric": "manhattan"},
    {"pca": 15, "k": 32, "metric": "manhattan"},
    {"pca": 30, "k": 40, "metric": "cosine"},
    {"pca": 35, "k": 40, "metric": "cosine"},
    {"pca": 40, "k": 40, "metric": "cosine"},
    {"pca": 30, "k": 50, "metric": "cosine"},
    {"pca": 30, "k": 60, "metric": "cosine"},
    {"pca": 30, "k": 40, "metric": "correlation"},
    {"pca": 40, "k": 40, "metric": "correlation"},
    {"pca": 30, "k": 50, "metric": "correlation"},
    {"pca": 30, "k": 60, "metric": "correlation"},
]

meta_oof = []
meta_test = []

print(f"Running {len(configs)} Stacked Models (Fixed y_tr)...")

for i, cfg in enumerate(configs):
    print(f"Model {i + 1}: {cfg}")

    oof = np.zeros((len(X), num_classes))
    test_p = np.zeros((len(test), num_classes))

    for fold, (tr, val) in enumerate(skf.split(X, y_enc)):
        X_tr, X_val = X.iloc[tr].copy(), X.iloc[val].copy()
        y_tr, y_val = y_enc[tr], y_enc[val]

        X_te = X_test_base.copy()

        sc = StandardScaler()
        X_tr_s = sc.fit_transform(X_tr)
        X_val_s = sc.transform(X_val)
        X_te_s = sc.transform(X_te)

        pca = PCA(n_components=cfg["pca"], whiten=True, random_state=42)
        Xp = pca.fit_transform(X_tr_s)
        Xv = pca.transform(X_val_s)
        Xt = pca.transform(X_te_s)

        knn = KNeighborsClassifier(
            n_neighbors=cfg["k"], metric=cfg["metric"], weights="distance", n_jobs=-1
        )
        knn.fit(Xp, y_tr)

        oof[val] = knn.predict_proba(Xv)
        test_p += knn.predict_proba(Xt) / folds

    meta_oof.append(oof)
    meta_test.append(test_p)


meta_oof = np.hstack(meta_oof)
meta_test = np.hstack(meta_test)

print(f"Meta-Feature Shape: {meta_oof.shape}")

meta_model = LogisticRegression(C=0.5, max_iter=5000, solver="lbfgs", random_state=42)

meta_model.fit(meta_oof, y_enc)

meta_preds = meta_model.predict(meta_oof)
score = accuracy_score(y_enc, meta_preds)
print("------------------------------------------------")
print(f"🔥 CORRECTED STACKED CV ACC: {score:.4f}")
print("------------------------------------------------")


final_preds = meta_model.predict(meta_test)
final_labels = le.inverse_transform(final_preds)
submission = pd.DataFrame({"id": test["id"], "target": final_labels})
submission.to_csv("submission.csv", index=False)
