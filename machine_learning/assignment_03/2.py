from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

df = pd.read_csv("USA_Housing.csv")
print(df.head())

X = df.drop("Price", axis=1)
y = df["Price"]

X_train, X_temp, y_train, y_temp = train_test_split(
    X, y, test_size=0.44, random_state=42
)
X_val, X_test, y_val, y_test = train_test_split(
    X_temp, y_temp, test_size=0.5, random_state=42
)

scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_val = scaler.transform(X_val)
X_test = scaler.transform(X_test)

learning_rates = [0.001, 0.01, 0.1, 1]
best_r2 = -np.inf
best_model = None

for lr in learning_rates:
    model = LinearRegression()
    model.fit(X_train, y_train)

    r2_val = model.score(X_val, y_val)
    r2_test = model.score(X_test, y_test)

    print(f"Learning Rate: {lr}, R2 Validation: {r2_val}, R2 Test: {r2_test}")

    if r2_val > best_r2:
        best_r2 = r2_val
        best_model = model

print(f"Best R2 on Validation Set: {best_r2}")
print(f"Best Model Coefficients: {best_model.coef_}")
