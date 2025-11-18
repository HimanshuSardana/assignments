import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import AdaBoostClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

RANDOM_STATE = 42

try:
    data = pd.read_csv(
        "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data",
        header=None,
        na_values="?",
    )
except Exception:
    print("Could not load data from URL. Using dummy structure.")
    data = pd.DataFrame(np.random.randint(0, 100, size=(303, 14)), columns=range(14))
    data[13] = np.where(data[13] > 40, 1, 0)  # Create dummy target

cols = [
    "age",
    "sex",
    "cp",
    "trestbps",
    "chol",
    "fbs",
    "restecg",
    "thalach",
    "exang",
    "oldpeak",
    "slope",
    "ca",
    "thal",
    "target",
]
data.columns = cols

data["target"] = data["target"].apply(lambda x: 1 if x > 0 else 0)

data = data.dropna()

X = data.drop("target", axis=1)
y = data["target"]

numeric_features = ["age", "trestbps", "chol", "thalach", "oldpeak"]
categorical_features = ["sex", "cp", "fbs", "restecg", "exang", "slope", "ca", "thal"]

preprocessor = ColumnTransformer(
    transformers=[
        ("num", StandardScaler(), numeric_features),
        (
            "cat",
            OneHotEncoder(handle_unknown="ignore", sparse_output=False),
            categorical_features,
        ),
    ],
    remainder="passthrough",
)

X_processed = preprocessor.fit_transform(X)
feature_names = preprocessor.get_feature_names_out()

X_train, X_test, y_train, y_test = train_test_split(
    X_processed, y, test_size=0.2, random_state=RANDOM_STATE, stratify=y
)

print(f"Processed Data Shapes: Train {X_train.shape}, Test {X_test.shape}")


stump = DecisionTreeClassifier(max_depth=1, random_state=RANDOM_STATE)
stump.fit(X_train, y_train)

y_train_pred = stump.predict(X_train)
y_test_pred = stump.predict(X_test)

print(f"Training Accuracy: {accuracy_score(y_train, y_train_pred):.4f}")
print(f"Test Accuracy:     {accuracy_score(y_test, y_test_pred):.4f}")
print("\nConfusion Matrix (Test):\n", confusion_matrix(y_test, y_test_pred))
print("\nClassification Report (Test):\n", classification_report(y_test, y_test_pred))


n_estimators_list = [5, 10, 25, 50, 100]
learning_rate_list = [0.1, 0.5, 1.0]

results = pd.DataFrame(columns=["n_estimators", "learning_rate", "test_accuracy"])
best_acc = 0
best_config = {}

plt.figure(figsize=(10, 6))

for lr in learning_rate_list:
    accuracy_scores = []

    for n_est in n_estimators_list:
        ada_clf = AdaBoostClassifier(
            estimator=DecisionTreeClassifier(max_depth=1, random_state=RANDOM_STATE),
            n_estimators=n_est,
            learning_rate=lr,
            random_state=RANDOM_STATE,
        )

        ada_clf.fit(X_train, y_train)
        test_acc = ada_clf.score(X_test, y_test)

        accuracy_scores.append(test_acc)

        results.loc[len(results)] = [n_est, lr, test_acc]

        if test_acc > best_acc:
            best_acc = test_acc
            best_config = {"n_estimators": n_est, "learning_rate": lr}

    plt.plot(n_estimators_list, accuracy_scores, marker="o", label=f"LR = {lr}")

plt.title("AdaBoost Accuracy vs. Number of Estimators (T)")
plt.xlabel("n_estimators (T)")
plt.ylabel("Test Accuracy")
plt.legend()
plt.grid(True, linestyle="--", alpha=0.6)
plt.show()

print("\nHyperparameter Search Results (Accuracy):")
print(
    results.pivot(
        index="n_estimators", columns="learning_rate", values="test_accuracy"
    ).round(4)
)
print(
    f"\nIdentified Best Configuration: n_estimators={best_config['n_estimators']}, learning_rate={best_config['learning_rate']} (Accuracy: {best_acc:.4f})"
)
print("-" * 50)

best_model = AdaBoostClassifier(
    estimator=DecisionTreeClassifier(max_depth=1, random_state=RANDOM_STATE),
    n_estimators=best_config["n_estimators"],
    learning_rate=best_config["learning_rate"],
    random_state=RANDOM_STATE,
)
best_model.fit(X_train, y_train)

staged_train_errors = 1 - np.array(list(best_model.staged_score(X_train, y_train)))
staged_iterations = np.arange(1, len(staged_train_errors) + 1)

plt.figure(figsize=(8, 5))
plt.plot(staged_iterations, staged_train_errors, marker="o", color="purple")
plt.title("Weak Learner Ensemble Error (1 - Accuracy) vs. Iteration")
plt.xlabel("Boosting Iteration (t)")
plt.ylabel("Ensemble Training Error")
plt.grid(True, linestyle="--", alpha=0.6)
plt.show()

final_weights = best_model.estimator_weights_

plt.figure(figsize=(8, 5))
plt.hist(best_model.sample_weights_, bins=50, color="darkorange", edgecolor="black")
plt.title("Sample Weight Distribution after Final Boosting Stage")
plt.xlabel("Sample Weight (D_i)")
plt.ylabel("Number of Samples")
plt.yscale("log")  # Use log scale because most weights are very small
plt.grid(axis="y", linestyle="--", alpha=0.6)
plt.show()

importance = best_model.feature_importances_

feature_names_list = list(preprocessor.get_feature_names_out())

feature_importance_df = pd.DataFrame({
    "feature": feature_names_list,
    "importance": importance,
})
feature_importance_df = feature_importance_df.sort_values(
    by="importance", ascending=False
)

plt.figure(figsize=(12, 6))
plt.bar(
    feature_importance_df["feature"][:10],
    feature_importance_df["importance"][:10],
    color="skyblue",
)
plt.xticks(rotation=45, ha="right")
plt.title("Top 10 Feature Importance from AdaBoost Model")
plt.ylabel("Relative Importance")
plt.tight_layout()
plt.show()

top_5_features = feature_importance_df.head(5)
print("\nTop 5 Most Important Features:")
print(top_5_features)

top_features_explanation = {
    "thal": "Thallium Stress Test results are crucial, as perfusion defects ('thal' values) are direct indicators of reduced blood flow (ischemia) to heart muscle.",
    "ca": "# of Major Vessels colored by fluoroscopy ('ca') directly relates to the severity and extent of coronary artery disease (CAD). More blocked vessels mean higher risk.",
    "cp": "Chest Pain Type ('cp') is a key diagnostic indicator. Atypical or asymptomatic pain (non-anginal) is less concerning than typical angina, making the categories highly predictive.",
    "oldpeak": "ST Depression ('oldpeak') measures the extent of myocardial ischemia during exercise. A larger depression indicates greater oxygen debt and is a strong predictor of CAD.",
    "thalach": "Maximum Heart Rate Achieved ('thalach') is inverse: lower max heart rate for age often indicates disease, as the heart cannot properly respond to the stress test due to blockage or pump dysfunction.",
}

for _, row in top_5_features.iterrows():
    base_feature = row["feature"].split("__")[-1].split("_")[0]
    print(f"\nFeature: **{row['feature']}** (Base: {base_feature})")
    print(
        f"Explanation: {top_features_explanation.get(base_feature, 'Feature importance reflects strong empirical correlation with the outcome.')}"
    )
