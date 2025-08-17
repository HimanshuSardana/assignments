import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler, StandardScaler, OneHotEncoder
from sklearn.metrics.pairwise import cosine_similarity
from scipy.spatial.distance import jaccard

df = pd.read_csv("./AWCustomers.csv")

df['Age'] = pd.to_datetime('today').year - pd.to_datetime(df['BirthDate']).dt.year

selected_features = [
    'Age',
    'Education',
    'Occupation',
    'Gender',
    'MaritalStatus',
    'HomeOwnerFlag',
    'NumberCarsOwned',
    'YearlyIncome'
]

df_selected = df[selected_features].copy()

# part 2 
# (a) Handle null values
for col in df_selected.columns:
    if df_selected[col].dtype in [np.float64, np.int64]:
        df_selected[col] = df_selected[col].fillna(df_selected[col].median())
    else:
        df_selected[col] = df_selected[col].fillna(df_selected[col].mode()[0])

# (b) Normalization (Min-Max scaling for numeric columns)
numeric_cols = df_selected.select_dtypes(include=[np.number]).columns
scaler = MinMaxScaler()
df_selected[numeric_cols] = scaler.fit_transform(df_selected[numeric_cols])

# (c) Discretization 
df_selected['Age_binned'] = pd.cut(df_selected['Age'], bins=4, labels=False)

# (d) Standardization
std_scaler = StandardScaler()
df_selected[numeric_cols] = std_scaler.fit_transform(df_selected[numeric_cols])

# (e) One Hot Encoding
categorical_cols = df_selected.select_dtypes(exclude=[np.number]).columns
encoder = OneHotEncoder(sparse_output=False)
encoded_data = encoder.fit_transform(df_selected[categorical_cols])
encoded_df = pd.DataFrame(encoded_data, columns=encoder.get_feature_names_out(categorical_cols))
df_final = pd.concat([df_selected.drop(columns=categorical_cols), encoded_df], axis=1)

# part 3
obj1 = df_final.iloc[0].values.reshape(1, -1)
obj2 = df_final.iloc[1].values.reshape(1, -1)

cos_sim = cosine_similarity(obj1, obj2)[0][0]
# jacard
binary_cols = encoded_df.columns
jac_sim = 1 - jaccard(encoded_df.iloc[0], encoded_df.iloc[1])

# Simple Matching Coefficient (SMC)
smc = (obj1 == obj2).sum() / len(obj1[0])

print(f"Cosine Similarity: {cos_sim}")
print(f"Jaccard Similarity: {jac_sim}")
print(f"Simple Matching Coefficient: {smc}")

corr = np.corrcoef(df['NumberCarsOwned'], df['YearlyIncome'])[0, 1]
print(f"Correlation (NumberCarsOwned vs YearlyIncome): {corr}")

