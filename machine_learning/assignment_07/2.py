import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression, Ridge, Lasso
from sklearn.metrics import r2_score, mean_squared_error

df = pd.read_csv("hitters.csv")

df = df.dropna(subset=["Salary"])
df = pd.get_dummies(df, columns=["League", "Division", "NewLeague"], drop_first=True)

X = df.drop("Salary", axis=1).values
y = df["Salary"].values

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=69
)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

lin_reg = LinearRegression()
lin_reg.fit(X_train_scaled, y_train)

ridge_reg = Ridge(alpha=0.5748)
ridge_reg.fit(X_train_scaled, y_train)

lasso_reg = Lasso(alpha=0.5748, max_iter=10000)
lasso_reg.fit(X_train_scaled, y_train)

models = {
    "Linear Regression": lin_reg,
    "Ridge Regression": ridge_reg,
    "Lasso Regression": lasso_reg,
}

print(f"{'Model':<20} | {'R2 Score':<10} | {'RMSE':<10}")

best_model_name = ""
best_r2 = -np.inf

for name, model in models.items():
    y_pred = model.predict(X_test_scaled)

    r2 = r2_score(y_test, y_pred)
    rmse = np.sqrt(mean_squared_error(y_test, y_pred))

    print(f"{name:<20} | {r2:.4f}     | {rmse:.2f}")

    if r2 > best_r2:
        best_r2 = r2
        best_model_name = name

print(f"The best performing model is: {best_model_name}")
