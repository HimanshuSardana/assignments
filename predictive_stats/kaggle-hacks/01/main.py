from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.linear_model import ElasticNet
from sklearn.metrics import mean_squared_error
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# Load
train_df = pd.read_csv("./train.csv")
train_df = train_df.loc[:, ~train_df.T.duplicated()]

X = train_df.drop(columns=["target"])
y = train_df["target"]

# Log-transform target first
y = np.log1p(y)

# Remove outliers globally
mask = y < y.quantile(0.99)
X = X[mask]
y = y[mask]

# Standard scaling
scaler = StandardScaler()
X = pd.DataFrame(scaler.fit_transform(X), columns=X.columns)

# Train/valid split
X_train, X_valid, y_train, y_valid = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# PCA
pca = PCA(n_components=0.95, random_state=42)
X_train_pca = pca.fit_transform(X_train)
X_valid_pca = pca.transform(X_valid)

print(f"Original number of features: {X_train.shape[1]}")
print(f"Reduced number of features after PCA: {X_train_pca.shape[1]}")
print(f"Total explained variance: {np.sum(pca.explained_variance_ratio_):.4f}")

# Optional: PCA correlation heatmap
corr_matrix = pd.DataFrame(
    X_train_pca, columns=[f"PC{i + 1}" for i in range(X_train_pca.shape[1])]
).corr()
plt.figure(figsize=(10, 8))
sns.heatmap(corr_matrix, cmap="coolwarm", center=0)
plt.title("Correlation between Principal Components")
plt.savefig("correlation_matrix.png")
plt.close()

# Model: ElasticNet
model = ElasticNet(alpha=0.1, l1_ratio=0.5, random_state=42, max_iter=10000)
model.fit(X_train_pca, y_train)

# Predictions
y_pred = np.expm1(model.predict(X_valid_pca))

# RMSE
rmse = np.sqrt(mean_squared_error(np.expm1(y_valid), y_pred))
print(f"Validation RMSE: {rmse:.4f}")
