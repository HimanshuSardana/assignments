import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler, PowerTransformer, QuantileTransformer
from sklearn.model_selection import StratifiedKFold, GridSearchCV, cross_val_score
from sklearn.feature_selection import SelectKBest, f_classif, mutual_info_classif
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import VotingClassifier, BaggingClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
import warnings

warnings.filterwarnings("ignore")

# Load data
train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

y = train["target"].astype(int)
X = train.drop(columns=["id", "target"])
test_ids = test["id"]
X_test = test.drop(columns=["id"])

print(f"Dataset: {X.shape}, Classes: {y.nunique()}")

# Remove duplicate columns
X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

print("\n" + "=" * 60)
print("STRATEGY 1: Advanced Feature Engineering")
print("=" * 60)

# Create polynomial and interaction features for top features
from sklearn.preprocessing import PolynomialFeatures

# First identify most important features
selector_quick = SelectKBest(score_func=f_classif, k=10)
selector_quick.fit(X, y)
top_feature_idx = selector_quick.get_support(indices=True)
top_features = X.columns[top_feature_idx]

print("Top 10 features identified, creating interactions...")

# Create interactions only from top features to avoid explosion
X_top = X[top_features]
X_test_top = X_test[top_features]

poly = PolynomialFeatures(degree=2, interaction_only=True, include_bias=False)
X_interactions = poly.fit_transform(X_top)
X_test_interactions = poly.transform(X_test_top)

# Combine original features with interactions
X_enhanced = np.hstack([X.values, X_interactions])
X_test_enhanced = np.hstack([X_test.values, X_test_interactions])

print(f"Features expanded from {X.shape[1]} to {X_enhanced.shape[1]}")

# Test different scalers
best_score = 0
best_scaler_name = ""
best_X_scaled = None
best_X_test_scaled = None

scalers = {
    "Standard": StandardScaler(),
    "PowerTransform": PowerTransformer(method="yeo-johnson"),
    "QuantileTransform": QuantileTransformer(
        output_distribution="normal", random_state=42
    ),
}

print("\nTesting different scalers...")
for scaler_name, scaler in scalers.items():
    X_scaled_temp = scaler.fit_transform(X_enhanced)
    X_test_scaled_temp = scaler.transform(X_test_enhanced)

    # Quick test with known good params
    selector_temp = SelectKBest(score_func=f_classif, k=30)
    X_sel_temp = selector_temp.fit_transform(X_scaled_temp, y)

    knn_temp = KNeighborsClassifier(n_neighbors=19, weights="distance", metric="cosine")
    kf = StratifiedKFold(n_splits=10, shuffle=True, random_state=42)
    score = cross_val_score(
        knn_temp, X_sel_temp, y, cv=kf, scoring="accuracy", n_jobs=-1
    ).mean()

    print(f"  {scaler_name}: {score:.4f}")

    if score > best_score:
        best_score = score
        best_scaler_name = scaler_name
        best_X_scaled = X_scaled_temp
        best_X_test_scaled = X_test_scaled_temp

print(f"Best scaler: {best_scaler_name}")

print("\n" + "=" * 60)
print("STRATEGY 2: Advanced Feature Selection")
print("=" * 60)

# Test different feature selection methods
best_selector_score = 0
best_selector_name = ""
best_X_selected = None
best_X_test_selected = None
best_n_features = 30

selection_methods = {
    "f_classif": f_classif,
    "mutual_info": mutual_info_classif,
}

for method_name, method in selection_methods.items():
    print(f"\nTesting {method_name}...")
    for k in [25, 30, 35, 40, 50, 60, 75]:
        if k > best_X_scaled.shape[1]:
            continue

        selector = SelectKBest(score_func=method, k=k)
        X_sel = selector.fit_transform(best_X_scaled, y)

        knn_temp = KNeighborsClassifier(
            n_neighbors=19, weights="distance", metric="cosine"
        )
        kf = StratifiedKFold(n_splits=50, shuffle=True, random_state=42)
        score = cross_val_score(
            knn_temp, X_sel, y, cv=kf, scoring="accuracy", n_jobs=-1
        ).mean()

        print(f"  k={k}: {score:.4f}")

        if score > best_selector_score:
            best_selector_score = score
            best_selector_name = method_name
            best_n_features = k
            best_X_selected = X_sel
            best_X_test_selected = selector.transform(best_X_test_scaled)

print(
    f"\nBest selection: {best_selector_name} with k={best_n_features}, score={best_selector_score:.4f}"
)

print("\n" + "=" * 60)
print("STRATEGY 3: Hyperparameter Optimization")
print("=" * 60)

# Fine-grained search around best parameters
param_grid = {
    "n_neighbors": [15, 17, 19, 21, 23, 25],
    "weights": ["distance"],
    "metric": ["cosine", "manhattan", "minkowski"],
    "p": [1, 2, 3],  # for minkowski
}

best_model_score = 0
best_model = None
best_params = None

for n_splits in [200, 225, 250, 275, 300]:
    print(f"\nTesting n_splits={n_splits}...")

    try:
        kf = StratifiedKFold(n_splits=n_splits, shuffle=True, random_state=42)

        knn_search = GridSearchCV(
            estimator=KNeighborsClassifier(n_jobs=-1),
            param_grid=param_grid,
            cv=kf,
            scoring="accuracy",
            n_jobs=-1,
            verbose=0,
        )

        knn_search.fit(best_X_selected, y)
        score = knn_search.best_score_

        print(f"  Score: {score:.4f}, Params: {knn_search.best_params_}")

        if score > best_model_score:
            best_model_score = score
            best_model = knn_search.best_estimator_
            best_params = knn_search.best_params_
            best_n_splits = n_splits

    except Exception as e:
        print(f"  Skipped: {e}")

print("\n" + "=" * 60)
print("STRATEGY 4: Meta-Classifier (Bagging)")
print("=" * 60)

# Try bagging with best KNN
bagging = BaggingClassifier(
    estimator=KNeighborsClassifier(**best_params),
    n_estimators=10,
    max_samples=0.8,
    max_features=0.8,
    random_state=42,
    n_jobs=-1,
)

kf = StratifiedKFold(n_splits=best_n_splits, shuffle=True, random_state=42)
bagging_score = cross_val_score(
    bagging, best_X_selected, y, cv=kf, scoring="accuracy", n_jobs=-1
).mean()

print(f"Bagging KNN score: {bagging_score:.4f}")

if bagging_score > best_model_score:
    print("Bagging improves performance!")
    best_model = bagging
    best_model_score = bagging_score

print("\n" + "=" * 60)
print("STRATEGY 5: Weighted Ensemble")
print("=" * 60)

# Create diverse KNN models
knn1 = KNeighborsClassifier(n_neighbors=17, weights="distance", metric="cosine")
knn2 = KNeighborsClassifier(n_neighbors=19, weights="distance", metric="cosine")
knn3 = KNeighborsClassifier(n_neighbors=21, weights="distance", metric="manhattan")
knn4 = KNeighborsClassifier(n_neighbors=23, weights="distance", metric="cosine")

# Also try LDA as it works well for multi-class
lda = LinearDiscriminantAnalysis()

ensemble_soft = VotingClassifier(
    estimators=[
        ("knn1", knn1),
        ("knn2", knn2),
        ("knn3", knn3),
        ("knn4", knn4),
        ("lda", lda),
    ],
    voting="soft",
    n_jobs=-1,
)

ensemble_score = cross_val_score(
    ensemble_soft, best_X_selected, y, cv=kf, scoring="accuracy", n_jobs=-1
).mean()
print(f"Soft voting ensemble score: {ensemble_score:.4f}")

if ensemble_score > best_model_score:
    print("Ensemble improves performance!")
    best_model = ensemble_soft
    best_model_score = ensemble_score

print("\n" + "=" * 60)
print("FINAL RESULTS")
print("=" * 60)
print(f"Best CV Accuracy: {best_model_score:.4f}")
print(f"Improvement over baseline: {(best_model_score - 0.2861):.4f}")
print(f"Best params: {best_params}")
print("=" * 60)

# Train final model and predict
print("\nTraining final model...")
best_model.fit(best_X_selected, y)
predictions = best_model.predict(best_X_test_selected)

submission = pd.DataFrame({"id": test_ids, "target": predictions})
submission.to_csv("submission_advanced.csv", index=False)

print("\nPredictions saved to submission_advanced.csv")
print(f"Expected accuracy: ~{best_model_score:.4f}")

# Save detailed configuration
with open("advanced_config.txt", "w") as f:
    f.write(f"Best Scaler: {best_scaler_name}\n")
    f.write("Feature Engineering: Polynomial interactions from top 10 features\n")
    f.write(f"Total features after engineering: {X_enhanced.shape[1]}\n")
    f.write(f"Best Feature Selection: {best_selector_name}\n")
    f.write(f"Selected features: {best_n_features}\n")
    f.write(f"Best CV splits: {best_n_splits}\n")
    f.write(f"Best model params: {best_params}\n")
    f.write(f"Best CV Accuracy: {best_model_score:.4f}\n")

print("\n" + "=" * 60)
print("BONUS: Testing alternative approach with ALL features")
print("=" * 60)

# Sometimes more features help
X_scaled_all = scalers[best_scaler_name].fit_transform(X_enhanced)
X_test_scaled_all = scalers[best_scaler_name].transform(X_test_enhanced)

for k in [100, 150, 200, 300]:
    if k > X_scaled_all.shape[1]:
        k = X_scaled_all.shape[1]

    selector_all = SelectKBest(score_func=selection_methods[best_selector_name], k=k)
    X_sel_all = selector_all.fit_transform(X_scaled_all, y)

    knn_all = KNeighborsClassifier(**best_params)
    kf_test = StratifiedKFold(n_splits=100, shuffle=True, random_state=42)
    score_all = cross_val_score(
        knn_all, X_sel_all, y, cv=kf_test, scoring="accuracy", n_jobs=-1
    ).mean()

    print(f"k={k} features: {score_all:.4f}")

    if score_all > best_model_score:
        print(f"  *** NEW BEST with {k} features! ***")
        best_model_score = score_all
        knn_all.fit(X_sel_all, y)
        X_test_sel_all = selector_all.transform(X_test_scaled_all)
        predictions_all = knn_all.predict(X_test_sel_all)
        submission_all = pd.DataFrame({"id": test_ids, "target": predictions_all})
        submission_all.to_csv("submission_advanced_more_features.csv", index=False)
        print("  Saved to submission_advanced_more_features.csv")

print("\n" + "=" * 60)
print(f"FINAL BEST ACCURACY: {best_model_score:.4f}")
print("=" * 60)
