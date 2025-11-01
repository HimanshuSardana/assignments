import numpy as np
from sklearn import datasets
from sklearn.model_selection import train_test_split

iris_df = datasets.load_iris()
X = iris_df.data
y = iris_df.target


def mean(X):
    return np.mean(X, axis=0)


def variance(X):
    return np.var(X, axis=0)


def fit(X, y):
    model = {}
    model["classes"] = np.unique(y)
    model["mean"] = {}
    model["var"] = {}
    model["prior"] = {}

    for c in model["classes"]:
        X_c = X[y == c]
        model["mean"][c] = mean(X_c)
        model["var"][c] = variance(X_c)
        model["prior"][c] = X_c.shape[0] / X.shape[0]

    return model


def gaussian_prob(x, mean, var):
    exponent = np.exp(-((x - mean) ** 2) / (2 * var))
    return (1 / np.sqrt(2 * np.pi * var)) * exponent


def predict(model, X):
    y_pred = []
    for x in X:
        class_probs = {}
        for c in model["classes"]:
            prior = np.log(model["prior"][c])
            likelihood = np.sum(
                np.log(gaussian_prob(x, model["mean"][c], model["var"][c]))
            )
            class_probs[c] = prior + likelihood
        y_pred.append(max(class_probs, key=class_probs.get))
    return np.array(y_pred)


X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
model = fit(X_train, y_train)
y_pred = predict(model, X_test)

print("Predicted labels:", y_pred)
accuracy = np.mean(y_pred == y_test)
print(f"Accuracy: {accuracy * 100:.2f}%")
