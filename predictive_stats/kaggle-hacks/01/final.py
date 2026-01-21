import numpy as np
import pandas as pd
import warnings

from sklearn.model_selection import StratifiedKFold
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.decomposition import PCA
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score

warnings.filterwarnings("ignore")

print("Loading Data...")
train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

X = train.drop(columns=["id", "target"])
y = train["target"]
X_test_base = test.drop(columns=["id"])

le = LabelEncoder()
y_enc = le.fit_transform(y)
num_classes = len(np.unique(y_enc))

folds = 15
skf = StratifiedKFold(n_splits=folds, shuffle=True, random_state=42)

meta_oof = []
meta_test = []

print("Running KNN...")

knn_oof = np.zeros((len(X), num_classes))
knn_test = np.zeros((len(test), num_classes))

for fold, (tr, val) in enumerate(skf.split(X, y_enc)):
    X_tr, X_val = X.iloc[tr], X.iloc[val]
    y_tr, y_val = y_enc[tr], y_enc[val]

    sc = StandardScaler()
    X_tr_s = sc.fit_transform(X_tr)
    X_val_s = sc.transform(X_val)
    X_te_s = sc.transform(X_test_base)

    pca = PCA(n_components=20, whiten=True, random_state=42)
    Xp = pca.fit_transform(X_tr_s)
    Xv = pca.transform(X_val_s)
    Xt = pca.transform(X_te_s)

    knn = KNeighborsClassifier(
        n_neighbors=40, metric="cosine", weights="distance", n_jobs=-1
    )
    knn.fit(Xp, y_tr)

    knn_oof[val] = knn.predict_proba(Xv)
    knn_test += knn.predict_proba(Xt) / folds

meta_oof.append(knn_oof)
meta_test.append(knn_test)

print("Running Linear SVM...")

svm_lin_oof = np.zeros((len(X), num_classes))
svm_lin_test = np.zeros((len(test), num_classes))

for fold, (tr, val) in enumerate(skf.split(X, y_enc)):
    X_tr, X_val = X.iloc[tr], X.iloc[val]
    y_tr = y_enc[tr]

    sc = StandardScaler()
    X_tr_s = sc.fit_transform(X_tr)
    X_val_s = sc.transform(X_val)
    X_te_s = sc.transform(X_test_base)

    svm_lin = SVC(
        kernel="linear",
        C=1.0,
        probability=True,
        class_weight="balanced",
        random_state=42,
    )
    svm_lin.fit(X_tr_s, y_tr)

    svm_lin_oof[val] = svm_lin.predict_proba(X_val_s)
    svm_lin_test += svm_lin.predict_proba(X_te_s) / folds

meta_oof.append(svm_lin_oof)
meta_test.append(svm_lin_test)

print("Running RBF SVM...")

svm_rbf_oof = np.zeros((len(X), num_classes))
svm_rbf_test = np.zeros((len(test), num_classes))

for fold, (tr, val) in enumerate(skf.split(X, y_enc)):
    X_tr, X_val = X.iloc[tr], X.iloc[val]
    y_tr = y_enc[tr]

    sc = StandardScaler()
    X_tr_s = sc.fit_transform(X_tr)
    X_val_s = sc.transform(X_val)
    X_te_s = sc.transform(X_test_base)

    svm_rbf = SVC(kernel="rbf", C=5, gamma="scale", probability=True, random_state=42)
    svm_rbf.fit(X_tr_s, y_tr)

    svm_rbf_oof[val] = svm_rbf.predict_proba(X_val_s)
    svm_rbf_test += svm_rbf.predict_proba(X_te_s) / folds

meta_oof.append(svm_rbf_oof)
meta_test.append(svm_rbf_test)

print("Running Logistic Regression...")

lr_oof = np.zeros((len(X), num_classes))
lr_test = np.zeros((len(test), num_classes))

for fold, (tr, val) in enumerate(skf.split(X, y_enc)):
    X_tr, X_val = X.iloc[tr], X.iloc[val]
    y_tr = y_enc[tr]

    sc = StandardScaler()
    X_tr_s = sc.fit_transform(X_tr)
    X_val_s = sc.transform(X_val)
    X_te_s = sc.transform(X_test_base)

    lr = LogisticRegression(
        C=0.3, solver="saga", multi_class="multinomial", max_iter=5000, n_jobs=-1
    )
    lr.fit(X_tr_s, y_tr)

    lr_oof[val] = lr.predict_proba(X_val_s)
    lr_test += lr.predict_proba(X_te_s) / folds

meta_oof.append(lr_oof)
meta_test.append(lr_test)

meta_oof = np.hstack(meta_oof)
meta_test = np.hstack(meta_test)

print(f"Meta Feature Shape: {meta_oof.shape}")

meta_model = LogisticRegression(
    C=1.0, solver="lbfgs", multi_class="multinomial", max_iter=5000, random_state=42
)

meta_model.fit(meta_oof, y_enc)

meta_preds = meta_model.predict(meta_oof)
score = accuracy_score(y_enc, meta_preds)

print("------------------------------------------------")
print(f"🔥 STACKED CV ACC: {score:.4f}")
print("------------------------------------------------")

final_preds = meta_model.predict(meta_test)
final_labels = le.inverse_transform(final_preds)

submission = pd.DataFrame({"id": test["id"], "target": final_labels})

submission.to_csv("submission.csv", index=False)
print("Submission saved!")
