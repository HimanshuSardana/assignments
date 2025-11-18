import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import RidgeCV, LassoCV

# load boston is deprecated :(
# df = load_boston(as_frame=True).frame
data_url = "https://raw.githubusercontent.com/selva86/datasets/master/BostonHousing.csv"
df = pd.read_csv(data_url)

X = df.drop("medv", axis=1)
y = df["medv"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)


alphas_to_test = [0.01, 0.1, 1.0, 10.0, 20.0, 50.0, 100.0]

ridge_cv = RidgeCV(alphas=alphas_to_test, cv=5)

ridge_cv.fit(X_train_scaled, y_train)

print(f"Best Alpha found by RidgeCV: {ridge_cv.alpha_}")
print(f"RidgeCV Train Score (R2): {ridge_cv.score(X_train_scaled, y_train):.4f}")
print(f"RidgeCV Test Score (R2):  {ridge_cv.score(X_test_scaled, y_test):.4f}")


lasso_cv = LassoCV(n_alphas=100, cv=5, random_state=42)

lasso_cv.fit(X_train_scaled, y_train)

print(f"Best Alpha found by LassoCV: {lasso_cv.alpha_}")
print(f"LassoCV Train Score (R2): {lasso_cv.score(X_train_scaled, y_train):.4f}")
print(f"LassoCV Test Score (R2):  {lasso_cv.score(X_test_scaled, y_test):.4f}")

coefs = pd.Series(lasso_cv.coef_, index=X.columns)
print(f"Number of features ignored by Lasso (Coef = 0): {sum(coefs == 0)}")
print("Features with 0 weight:", list(coefs[coefs == 0].index))
