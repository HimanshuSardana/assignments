import numpy as np
import pandas as pd
from sklearn.metrics import r2_score

df = pd.read_csv("./multiple_linear_regression_dataset.csv")

print(df.head())
print(df.isna().sum())

X = df.drop(columns=["income"]).values.astype(float)
y = df["income"].values.astype(float)

X_mean = X.mean(axis=0)
X_std = X.std(axis=0)
X = (X - X_mean) / X_std

y_mean = y.mean()
y_std = y.std()
y = (y - y_mean) / y_std

X = np.hstack([np.ones((X.shape[0], 1)), X])

eta = 0.01
epochs = 2000
inputLayer = X.shape[1]
outputLayer = 1


class LinearRegressionModel:
    def __init__(self, eta, inputLayer):
        self.eta = eta
        self.w = np.random.randn(inputLayer, 1) * 0.01
        self.losses = []

    def feedforward(self, X):
        return X @ self.w

    def compute_loss(self, y_pred, y_true):
        return np.mean((y_pred - y_true) ** 2)

    def backprop(self, X, y_true, y_pred):
        n = X.shape[0]
        grad = (2 / n) * X.T @ (y_pred - y_true)
        self.w -= self.eta * grad

    def train(self, X, y, epochs):
        y = y.reshape(-1, 1)
        for epoch in range(epochs):
            y_pred = self.feedforward(X)
            loss = self.compute_loss(y_pred, y)
            self.losses.append(loss)
            self.backprop(X, y, y_pred)

    def predict(self, X):
        return self.feedforward(X)


model = LinearRegressionModel(eta, inputLayer)
model.train(X, y, epochs)

print("Final Weights:\n", model.w)

y_pred = model.predict(X)

r2 = r2_score(y.flatten(), y_pred.flatten())
print("R2 Score:", r2)
