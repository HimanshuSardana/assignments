from sklearn.model_selection import KFold
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np

df = pd.read_csv('USA_Housing.csv')

X = df.drop('Price', axis=1)
y = df['Price']

# print(X.head())
# print(y.head())

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
# print(X_scaled[:5])

folds = KFold(n_splits=5, shuffle=True, random_state=42)
# print(folds)

best_r2 = -np.inf

for i, (train_index, test_index) in enumerate(folds.split(X_scaled)):
    X_train, X_test = X_scaled[train_index], X_scaled[test_index]
    y_train, y_test = y[train_index], y[test_index]

    X_train_b = np.c_[np.ones((X_train.shape[0], 1)), X_train]
    X_test_b = np.c_[np.ones((X_test.shape[0], 1)), X_test]

    beta = np.linalg.inv(X_train_b.T.dot(X_train_b)).dot(X_train_b.T).dot(y_train)
    y_pred = X_test_b.dot(beta)

    ss_total = np.sum((y_test - np.mean(y_test)) ** 2)
    ss_residual = np.sum((y_test - y_pred) ** 2)
    r2_score = 1 - (ss_residual / ss_total)

    if r2_score > best_r2:
        best_r2 = r2_score
        best_beta = beta

    print(f'Iteration {i+1}:')
    print(f'Beta coefficients: {beta}')
    print(f'R2 Score: {r2_score}\n')

print(f'Best R2 Score: {best_r2}')
print(f'Best Beta coefficients: {best_beta}')

split_index = int(0.7 * len(X_scaled))
X_train_final, X_test_final = X_scaled[:split_index], X_scaled[split_index:]
y_train_final, y_test_final = y[:split_index], y[split_index:]

X_train_final_b = np.c_[np.ones((X_train_final.shape[0], 1)), X_train_final]
y_pred_final = np.c_[np.ones((X_test_final.shape[0], 1)), X_test_final].dot(best_beta)

ss_total_final = np.sum((y_test_final - np.mean(y_test_final)) ** 2)
ss_residual_final = np.sum((y_test_final - y_pred_final) ** 2)

r2_score_final = 1 - (ss_residual_final / ss_total_final)
print(f'Final R2 Score on 30% test data: {r2_score_final}')
print(f'Predicted values on 30% test data: {y_pred_final[:5]}')

pred_df = pd.DataFrame(y_pred_final, columns=['Predicted_Price'])
print(X_test_final[:5])
print(pred_df.head())
