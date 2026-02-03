from sklearn.metrics import r2_score
import pandas as pd
import numpy as np

df = pd.read_csv("./multiple_linear_regression_dataset.csv")

print(df.head())
print(df.isna().sum())

X = df.drop(columns=["income"]).values
y = df["income"].values

eta = 0.001
epochs = 300
X = np.hstack([np.ones((X.shape[0], 1)), X])
inputLayer = X.shape[1]
outputLayer = 1


class LinearRegressionModel:
    def __init__(self, eta, inputLayer, outputLayer):
        self.eta = eta
        self.inputLayer = inputLayer
        self.outputLayer = outputLayer
        self.w = np.random.randn(self.inputLayer, 1) * 0.001
        self.delta_E_w = np.zeros((self.inputLayer, self.outputLayer))
        self.E = np.array([])
        self.w_list = []

    def feedforward(self, X):
        # X = self.add_bias(X)
        z = np.dot(X, self.w)
        return z

    def error(self, h, y):
        try:
            error = ((h - y) ** 2).mean()
        except OverflowError:
            error = float("inf")
        self.E = np.append(self.E, error)

    def backprop(self, X, y, h):
        n = X.shape[0]
        self.delta_E_w = (2 / n) * np.dot(X.T, (h - y.reshape(-1, 1)))
        self.w_list.append(self.w)
        self.w = self.w - self.eta * self.delta_E_w

    def predict(self, X):
        pred = self.feedforward(X)
        return pred

    def train(self, X, y, epochs):
        y = y.reshape(-1, 1)
        for epoch in range(epochs):
            h = self.feedforward(X)
            self.error(h, y)
            self.backprop(X, y, h)


model = LinearRegressionModel(eta, inputLayer, outputLayer)
model.train(X, y, epochs)
print("Final Weights:", model.w)

y_pred = model.predict(X)
print("Predictions:", y_pred.flatten())
print("R2 Score:", r2_score(y.flatten(), y_pred))
