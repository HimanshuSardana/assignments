# SVM models are highly sensitive to the scale of input features. When features have different
# ranges, the algorithm may incorrectly assign higher importance to variables with larger
# magnitudes, affecting the placement of the separating hyperplane. Feature scaling ensures
# that all attributes contribute equally to distance-based computations, which is especially
# crucial for kernels like RBF or polynomial.
# A) Use the Breast Cancer dataset from sklearn.datasets.load_breast_cancer.
# B) Train an SVM (RBF kernel) model with and without feature scaling
# (StandardScaler). Compare both results using:
# ● Training accuracy
# ● Testing accuracy
# C) Discuss the effect of feature scaling on SVM performance.

from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import accuracy_score

data = datasets.load_breast_cancer()
X = data.data
y = data.target

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

svm_no_scaling = SVC(kernel="rbf", random_state=42)
svm_no_scaling.fit(X_train, y_train)
y_train_pred_no_scaling = svm_no_scaling.predict(X_train)
y_test_pred_no_scaling = svm_no_scaling.predict(X_test)
train_accuracy_no_scaling = accuracy_score(y_train, y_train_pred_no_scaling)
test_accuracy_no_scaling = accuracy_score(y_test, y_test_pred_no_scaling)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)
svm_with_scaling = SVC(kernel="rbf", random_state=42)
svm_with_scaling.fit(X_train_scaled, y_train)
y_train_pred_with_scaling = svm_with_scaling.predict(X_train_scaled)
y_test_pred_with_scaling = svm_with_scaling.predict(X_test_scaled)
train_accuracy_with_scaling = accuracy_score(y_train, y_train_pred_with_scaling)
test_accuracy_with_scaling = accuracy_score(y_test, y_test_pred_with_scaling)

print("SVM without Feature Scaling:")
print(f"Training Accuracy: {train_accuracy_no_scaling:.4f}")
print(f"Testing Accuracy: {test_accuracy_no_scaling:.4f}")
print("\nSVM with Feature Scaling:")
print(f"Training Accuracy: {train_accuracy_with_scaling:.4f}")
print(f"Testing Accuracy: {test_accuracy_with_scaling:.4f}")
