import pandas as pd
import numpy as np
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import StandardScaler

df = pd.read_csv('./AWCustomers.csv')
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

print(df_selected.isnull().sum())

# Normalization
from sklearn.preprocessing import MinMaxScaler
numeric_cols = df_selected.select_dtypes(include=[float, int]).columns
scaler = MinMaxScaler()
df_selected[numeric_cols] = scaler.fit_transform(df_selected[numeric_cols])

# age binning
df_selected['Age_binned'] = pd.cut(df_selected['Age'], bins=4, labels=False)
print(df_selected['Age_binned'].value_counts())

std_scaler = StandardScaler()
df_selected[numeric_cols] = std_scaler.fit_transform(df_selected[numeric_cols])


categorical_cols = df_selected.select_dtypes(exclude=[np.number]).columns
encoder = OneHotEncoder(sparse_output=False)
encoded_data = encoder.fit_transform(df_selected[categorical_cols])
encoded_df = pd.DataFrame(encoded_data, columns=encoder.get_feature_names_out(categorical_cols))
df_final = pd.concat([df_selected.drop(columns=categorical_cols), encoded_df], axis=1)

print(df_final.columns)
