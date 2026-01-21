import pandas as pd
from sklearn.linear_model import LogisticRegression

df = pd.read_csv("train.csv")

X = df.drop(columns=["id", "target"])
X = X.loc[:, ~X.columns.duplicated()]
y = df["target"]

model = LogisticRegression(random_state=0)
model.fit(X, y)

score = model.score(X, y)
print(f"Training accuracy: {score:.4f}")
