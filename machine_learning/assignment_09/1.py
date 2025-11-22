# 1) The Iris dataset is a classic example for demonstrating classification algorithms. It
# consists of 150 samples of iris flowers belonging to three species: Setosa, Versicolor,
# and Virginica, with four input features (sepal and petal length/width). Use SVC from
# sklearn.svm on the Iris dataset and follow the steps below:
# a) Load the dataset and perform train–test split (80:20).
# b) Train three different SVM models using the following kernels:
# Linear, Polynomial (degree=3), RBF
# c) Evaluate each model using:
# ● Accuracy
# ● Precision
# ● Recall
# ● F1-Score
# d) Display the confusion matrix for each kernel.
# e) Identify which kernel performs the best and why

from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix,
)

iris = datasets.load_iris()

X = iris.data
y = iris.target

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
kernels = ["linear", "poly", "rbf"]

results = {}

for kernel in kernels:
    if kernel == "poly":
        model = SVC(kernel=kernel, degree=3)
    else:
        model = SVC(kernel=kernel)
    model.fit(X_train, y_train)
    y_pred = model.predict(X_test)

    accuracy = accuracy_score(y_test, y_pred)
    precision = precision_score(y_test, y_pred, average="weighted")
    recall = recall_score(y_test, y_pred, average="weighted")
    f1 = f1_score(y_test, y_pred, average="weighted")
    cm = confusion_matrix(y_test, y_pred)

    results[kernel] = {
        "accuracy": accuracy,
        "precision": precision,
        "recall": recall,
        "f1_score": f1,
        "confusion_matrix": cm,
    }

for kernel, metrics in results.items():
    print(f"Kernel: {kernel}")
    print(f"Accuracy: {metrics['accuracy']:.4f}")
    print(f"Precision: {metrics['precision']:.4f}")
    print(f"Recall: {metrics['recall']:.4f}")
    print(f"F1-Score: {metrics['f1_score']:.4f}")
    print("Confusion Matrix:")
    print(metrics["confusion_matrix"])
    print("\n")
