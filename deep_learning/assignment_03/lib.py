from sklearn.linear_model import LinearRegression
import pandas as pd
from sklearn.metrics import r2_score

df = pd.read_csv("./multiple_linear_regression_dataset.csv")
X = df.drop(columns=["income"]).values.astype(float)
y = df["income"].values.astype(float)

X_mean = X.mean(axis=0)
X_std = X.std(axis=0)

X = (X - X_mean) / X_std

y_mean = y.mean()
y_std = y.std()

y = (y - y_mean) / y_std

model = LinearRegression()
model.fit(X, y)
y_pred = model.predict(X)
r2 = r2_score(y, y_pred)
print(r2)
