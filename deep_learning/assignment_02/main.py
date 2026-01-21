import pandas as pd
import numpy as np

df = pd.read_csv("./glass.csv")
print(df.head())
df["Window"] = df["Type"].map({1: 0, 2: 0, 3: 0, 4: 0, 5: 1, 6: 1, 7: 1})

print(df["Type"].value_counts())
print(df["Window"].value_counts())
print(df.columns)


iv = ["RI", "Mg", "Al", "K"]
X = df[iv].values
y = df["Window"].values

eta = 0.001
epochs = 10000
inputLayer = X.shape[1]
outputLayer = 1


class LogisticRegressionSinglePerceptronModel:
    def __init__(self, eta, inputLayer, outputLayer):
        self.eta = eta
        self.inputLayer = inputLayer
        self.outputLayer = outputLayer
        self.w = np.random.randn(self.inputLayer, self.outputLayer)
        self.delta_E_w = np.zeros((self.inputLayer, self.outputLayer))
        self.E = np.array([])
        self.w_list = []

    iv = ["RI", "Na", "Mg", "Al", "Si", "K", "Ca", "Ba", "Fe"]
    X = df[iv].values

    def sigmoid(self, x):
        return 1 / (1 + np.exp(-x))

    def feedforward(self, X):
        # X = self.add_bias(X)
        z = np.dot(X, self.w)
        h = self.sigmoid(z)
        return h

    def error(self, h, y):
        error = (-y * np.log(h) - (1 - y) * np.log(1 - h)).mean()
        self.E = np.append(self.E, error)

    def backprop(self, X, y, h):
        self.delta_E_w = np.dot(X.T, h - y) / self.outputLayer

        # Store All weights throughout learning
        self.w_list.append(self.w)

        # Adjust weights
        self.w = self.w - eta * self.delta_E_w

    def predict(self, X):
        # Forward pass
        pred = self.feedforward(X)
        return pred

    def classify(self, y):
        return self.predict(y).round()

    def train(self, X, y):
        for epoch in range(epochs):
            # Forward pass
            h = self.feedforward(X)

            # Backpropagation - Calculate Weight adjustments and update weights
            self.backprop(X, y, h)

            # Calculate error based on the Cross Entropy Loss function
            self.error(h, y)


SPNN = LogisticRegressionSinglePerceptronModel(
    eta, inputLayer, outputLayer
)  # Train SPNN for Linear Regression Model
SPNN.train(X, y)
# SPNN.plot()
pred = SPNN.predict(X)  # Generate classified output
pred2 = SPNN.classify(X)  # Assess Model accuracy
print("Minimum Error achieved:", min(SPNN.E))  # SPNN weights
SPNN.w
