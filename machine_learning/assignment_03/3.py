from sklearn.metrics import r2_score
from sklearn.impute import SimpleImputer
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder

df = pd.read_csv("./data.csv")

column_names = [
    "symboling",
    "normalized_losses",
    "make",
    "fuel_type",
    "aspiration",
    "num_doors",
    "body_style",
    "drive_wheels",
    "engine_location",
    "wheel_base",
    "length",
    "width",
    "height",
    "curb_weight",
    "engine_type",
    "num_cylinders",
    "engine_size",
    "fuel_system",
    "bore",
    "stroke",
    "compression_ratio",
    "horsepower",
    "peak_rpm",
    "city_mpg",
    "highway_mpg",
    "price",
]
df.columns = column_names

df.replace("?", np.nan, inplace=True)

# print(df)

figures = {
    "zero": 0,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9,
}

df["num_doors"] = df["num_doors"].map(figures)
df["num_cylinders"] = df["num_cylinders"].map(figures)

df = pd.get_dummies(df, columns=["body_style", "drive_wheels"], drop_first=True)

label_encoder = LabelEncoder()

df["make"] = label_encoder.fit_transform(df["make"])
df["aspiration"] = label_encoder.fit_transform(df["aspiration"])
df["engine_location"] = label_encoder.fit_transform(df["engine_location"])
df["fuel_type"] = label_encoder.fit_transform(df["fuel_type"])

df["fuel_system"] = df["fuel_system"].apply(
    lambda x: 1 if "pfi" in str(x).lower() else 0
)
df["engine_type"] = df["engine_type"].apply(
    lambda x: 1 if "ohc" in str(x).lower() else 0
)

# imputation
num_cols = df.select_dtypes(include=[np.number]).columns
imputer = SimpleImputer(strategy="mean")
df[num_cols] = imputer.fit_transform(df[num_cols])

cat_cols = df.select_dtypes(exclude=[np.number]).columns
if len(cat_cols) > 0:
    cat_imputer = SimpleImputer(strategy="most_frequent")
    df[cat_cols] = cat_imputer.fit_transform(df[cat_cols])

X = df.drop("price", axis=1)
y = df["price"].astype(float)


scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
X = pd.DataFrame(X_scaled, columns=X.columns)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)
model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
mse = np.mean((y_test - y_pred) ** 2)
print(f"Mean Squared Error: {mse}")
r2 = r2_score(y_test, y_pred)
print(f"R2 Score: {r2}")

pca = PCA(n_components=0.95)  # retain 95% variance
X_pca = pca.fit_transform(X)
X_train_pca, X_test_pca, y_train, y_test = train_test_split(
    X_pca, y, test_size=0.3, random_state=42
)
model_pca = LinearRegression()
model_pca.fit(X_train_pca, y_train)
y_pred_pca = model_pca.predict(X_test_pca)
mse_pca = np.mean((y_test - y_pred_pca) ** 2)
print(f"Mean Squared Error after PCA: {mse_pca}")
r2_pca = r2_score(y_test, y_pred_pca)
print(f"R2 Score after PCA: {r2_pca}")
