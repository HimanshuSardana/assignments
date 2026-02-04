import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np

column_names = [
    "Sex",
    "Length",
    "Diameter",
    "Height",
    "Whole weight",
    "Shucked weight",
    "Viscera weight",
    "Shell weight",
    "Rings",
]


def normalize(X):
    X_min = X.min(axis=0)
    X_max = X.max(axis=0)
    X_norm = (X - X_min) / (X_max - X_min)
    return X_norm


class NN:
    def __init__(self, input_size, hidden_size, output_size):
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        self.weights_input_hidden = np.random.rand(input_size, hidden_size)
        self.weight_hidden_output = np.random.rand(hidden_size, output_size)

    def relu(self, x):
        return np.maximum(0, x)

    def relu_derivative(self, x):
        return (x > 0).astype(float)

    def feedforward(self, X):
        self.hidden_layer_input = np.dot(X, self.weights_input_hidden)
        self.hidden_layer_output = self.relu(self.hidden_layer_input)
        self.predicted_output = np.dot(
            self.hidden_layer_output, self.weight_hidden_output
        )

    def backpropagation(self, X, y, learning_rate=0.01):
        delta_output = self.predicted_output - y

        grad_w_ho = self.hidden_layer_output.T.dot(delta_output)

        hidden_error = delta_output.dot(self.weight_hidden_output.T)
        hidden_delta = hidden_error * self.relu_derivative(self.hidden_layer_input)
        grad_w_ih = X.T.dot(hidden_delta)

        self.weight_hidden_output -= learning_rate * grad_w_ho
        self.weights_input_hidden -= learning_rate * grad_w_ih

        return grad_w_ih, grad_w_ho

    def train(self, X, y, epochs, learning_rate):
        for epoch in range(epochs):
            self.feedforward(X)
            self.backpropagation(X, y)
            if epoch % 100 == 0:
                print(
                    f"Epoch {epoch}, Loss: {np.mean(np.square(y - self.predicted_output))}"
                )

        return self.predicted_output


df = pd.read_csv("abalone.data", names=column_names)
print(df.head())
print(df.describe())
nn = NN(input_size=8, hidden_size=5, output_size=1)
X = df.drop("Rings", axis=1).values
X[:, 0] = np.where(X[:, 0] == "M", 0, np.where(X[:, 0] == "F", 1, 2))
X = normalize(X)
X = X.astype(np.float64)
print(X)


y = df["Rings"].values.reshape(-1, 1)
y_min = y.min()
y_max = y.max()
y_norm = (y - y_min) / (y_max - y_min)

X_train, X_test, y_train, y_test = train_test_split(
    X, y_norm, test_size=0.2, random_state=42
)

predictions = nn.train(X_train, y_train, epochs=1000, learning_rate=0.01)
nn.feedforward(X_test)
predicted_test = nn.predicted_output
predicted_test_rescaled = predicted_test * (y_max - y_min) + y_min
