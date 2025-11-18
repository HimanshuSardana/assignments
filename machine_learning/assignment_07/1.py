import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.metrics import r2_score
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("./data.csv")
print(df.head())


def ridge_regression_gradient_descent(X, y, learning_rate, reg_param, num_iterations):
    m, n = X.shape
    theta = np.zeros(n)
    cost_history = []

    for _ in range(num_iterations):
        predictions = X.dot(theta)

        errors = predictions - y

        theta_for_reg = theta.copy()
        theta_for_reg[0] = 0

        gradient = (1 / m) * (X.T.dot(errors)) + (reg_param / m) * theta_for_reg

        theta -= learning_rate * gradient

        cost = (1 / (2 * m)) * np.sum(errors**2) + (reg_param / (2 * m)) * np.sum(
            theta_for_reg**2
        )
        cost_history.append(cost)

    return theta, cost_history


X = df.drop("Target_Variable", axis=1).values
y = df["Target_Variable"].values

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

X_train = np.c_[np.ones(X_train.shape[0]), X_train]
X_test = np.c_[np.ones(X_test.shape[0]), X_test]


learning_rates = [0.0001, 0.001, 0.01, 0.1, 1, 10]
reg_params = [1e-15, 1e-10, 1e-5, 1e-3, 0, 1, 10, 20]

best_r2 = -np.inf
best_params = None
best_theta = None
lowest_cost = np.inf

for lr in learning_rates:
    for reg in reg_params:
        theta, cost_history = ridge_regression_gradient_descent(
            X_train, y_train, lr, reg, 1000
        )

        if np.isnan(theta).any():
            continue

        y_pred = X_test.dot(theta)
        r2 = r2_score(y_test, y_pred)
        final_cost = cost_history[-1]

        if r2 > best_r2:
            best_r2 = r2
            best_params = (lr, reg)
            best_theta = theta
            lowest_cost = final_cost

print(f"Best Learning Rate: {best_params[0]}")
print(f"Best Regularization Parameter: {best_params[1]}")
print(f"Best R2 Score: {best_r2:.4f}")
print(f"Cost at Minimum: {lowest_cost:.4f}")
print(f"Best Coefficients (Thetas): \n{best_theta}")
