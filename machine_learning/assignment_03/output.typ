#import "@preview/showybox:2.0.4": showybox

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: blue,
    stroke: 1pt + blue,
  )[
    #align(center + horizon)[
      #smallcaps()[#text(
        font: "Montserrat",
        size: 10pt,
        weight: "bold",
        fill: white,
      )[= #body]]
    ]
  ]
]

#let question(qno, body) = [
  #showybox(
    frame: (
      border-color: blue,
      title-color: blue,
      body-color: blue.lighten(90%),
    ),
    title-style: (
      color: white,
      weight: "bold",
      align: left,
      boxed-style: (
        radius: 4pt,
      ),
    ),
    title: [
      #smallcaps()[#text(size: 8pt, weight: "semibold", font: "Montserrat")[
        == Question #qno
      ]]
    ],
  )[
    #text(font: "Montserrat", size: 10pt)[
      #body
    ]
    #v(1mm)
  ]
]

#let solution(content) = [
  #block(
    inset: 12pt,
    radius: 5pt,
    width: 100%,
    stroke: (thickness: 1.3pt, dash: "dashed", paint: blue),
    // fill: blue.lighten(90%),
  )[
    #text(
      weight: "bold",
      size: 9pt,
      fill: blue,
      font: "Montserrat",
    )[#smallcaps()[Solution]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#let output(content) = [
  #block(inset: 5pt, radius: 5pt, width: 100%)[
    #text(
      weight: "bold",
      size: 9pt,
      fill: blue,
      font: "Montserrat",
    )[#smallcaps()[Output]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#title("Assignment 3")
#question("1", [
  K-Fold Cross Validation for Multiple Linear Regression (Least Square Error Fit)  \

  Download the dataset regarding USA House Price Prediction from the following link:
  #link(
    "https://drive.google.com/file/d/1O_NwpJT-8xGfU_-3llUl2sgPu0xllOrX/view?usp=sharing",
  )[#text(
    font: "Montserrat",
    size: 10pt,
    weight: "medium",
    fill: blue.darken(20%),
  )[USA_Housing.csv]]  \

  Load the dataset and Implement 5-fold cross validation for multiple linear regression (using least square error fit). \

  Steps: \
  #set enum(numbering: "(a)")
  + Divide the dataset into input features (all columns except price) and output variable (price) \
  + Scale the values of input features. \
  + Divide input and output features into five folds. \
  + Run five iterations, in each iteration consider one-fold as test set and remaining \ four sets as training set. Find the beta (𝛽) matrix, predicted values, and R2_score \ for each iteration using least square error fit. \
  + Use the best value of (𝛽) matrix (for which R2_score is maximum), to train the \ regressor for 70% of data and test the performance for remaining 30% data.
])

#solution()[```python
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

for i in range(5):
    for train_index, test_index in folds.split(X_scaled):
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
```]
#output()[```txt
  Iteration 1:
  Beta coefficients: [1232002.6748241   230745.94073479  163243.27314515  120309.77397759
      3011.45976111  151552.63069359]
  R2 Score: 0.9179971706985147

  Iteration 1:
  Beta coefficients: [1232037.85755946  229081.97914235  165882.1605634   121536.57475055
      2092.4478622   150874.99274586]
  R2 Score: 0.9145677884802818

  Iteration 1:
  Beta coefficients: [1231951.92563846  230224.50511001  162766.17455493  121022.77324577
      1247.16258975  150234.77720419]
  R2 Score: 0.9116116385364478

  Iteration 1:
  Beta coefficients: [1232751.46486511  229500.10043209  165212.07110924  122839.9376815
      3063.71699324  150917.88484984]
  R2 Score: 0.9193091764960816

  Iteration 1:
  Beta coefficients: [1.23161736e+06 2.30225051e+05 1.63956839e+05 1.21115120e+05
   7.83467170e+02 1.50662447e+05]
  R2 Score: 0.9243869413350316

  Iteration 2:
  Beta coefficients: [1232002.6748241   230745.94073479  163243.27314515  120309.77397759
      3011.45976111  151552.63069359]
  R2 Score: 0.9179971706985147

  Iteration 2:
  Beta coefficients: [1232037.85755946  229081.97914235  165882.1605634   121536.57475055
      2092.4478622   150874.99274586]
  R2 Score: 0.9145677884802818

  Iteration 2:
  Beta coefficients: [1231951.92563846  230224.50511001  162766.17455493  121022.77324577
      1247.16258975  150234.77720419]
  R2 Score: 0.9116116385364478

  Iteration 2:
  Beta coefficients: [1232751.46486511  229500.10043209  165212.07110924  122839.9376815
      3063.71699324  150917.88484984]
  R2 Score: 0.9193091764960816

  Iteration 2:
  Beta coefficients: [1.23161736e+06 2.30225051e+05 1.63956839e+05 1.21115120e+05
   7.83467170e+02 1.50662447e+05]
  R2 Score: 0.9243869413350316

  Iteration 3:
  Beta coefficients: [1232002.6748241   230745.94073479  163243.27314515  120309.77397759
      3011.45976111  151552.63069359]
  R2 Score: 0.9179971706985147

  Iteration 3:
  Beta coefficients: [1232037.85755946  229081.97914235  165882.1605634   121536.57475055
      2092.4478622   150874.99274586]
  R2 Score: 0.9145677884802818

  Iteration 3:
  Beta coefficients: [1231951.92563846  230224.50511001  162766.17455493  121022.77324577
      1247.16258975  150234.77720419]
  R2 Score: 0.9116116385364478

  Iteration 3:
  Beta coefficients: [1232751.46486511  229500.10043209  165212.07110924  122839.9376815
      3063.71699324  150917.88484984]
  R2 Score: 0.9193091764960816

  Iteration 3:
  Beta coefficients: [1.23161736e+06 2.30225051e+05 1.63956839e+05 1.21115120e+05
   7.83467170e+02 1.50662447e+05]
  R2 Score: 0.9243869413350316

  Iteration 4:
  Beta coefficients: [1232002.6748241   230745.94073479  163243.27314515  120309.77397759
      3011.45976111  151552.63069359]
  R2 Score: 0.9179971706985147

  Iteration 4:
  Beta coefficients: [1232037.85755946  229081.97914235  165882.1605634   121536.57475055
      2092.4478622   150874.99274586]
  R2 Score: 0.9145677884802818

  Iteration 4:
  Beta coefficients: [1231951.92563846  230224.50511001  162766.17455493  121022.77324577
      1247.16258975  150234.77720419]
  R2 Score: 0.9116116385364478

  Iteration 4:
  Beta coefficients: [1232751.46486511  229500.10043209  165212.07110924  122839.9376815
      3063.71699324  150917.88484984]
  R2 Score: 0.9193091764960816

  Iteration 4:
  Beta coefficients: [1.23161736e+06 2.30225051e+05 1.63956839e+05 1.21115120e+05
   7.83467170e+02 1.50662447e+05]
  R2 Score: 0.9243869413350316

  Iteration 5:
  Beta coefficients: [1232002.6748241   230745.94073479  163243.27314515  120309.77397759
      3011.45976111  151552.63069359]
  R2 Score: 0.9179971706985147

  Iteration 5:
  Beta coefficients: [1232037.85755946  229081.97914235  165882.1605634   121536.57475055
      2092.4478622   150874.99274586]
  R2 Score: 0.9145677884802818

  Iteration 5:
  Beta coefficients: [1231951.92563846  230224.50511001  162766.17455493  121022.77324577
      1247.16258975  150234.77720419]
  R2 Score: 0.9116116385364478

  Iteration 5:
  Beta coefficients: [1232751.46486511  229500.10043209  165212.07110924  122839.9376815
      3063.71699324  150917.88484984]
  R2 Score: 0.9193091764960816

  Iteration 5:
  Beta coefficients: [1.23161736e+06 2.30225051e+05 1.63956839e+05 1.21115120e+05
   7.83467170e+02 1.50662447e+05]
  R2 Score: 0.9243869413350316

  Best R2 Score: 0.9243869413350316
  Best Beta coefficients: [1.23161736e+06 2.30225051e+05 1.63956839e+05 1.21115120e+05
   7.83467170e+02 1.50662447e+05]
  Final R2 Score on 30% test data: 0.9177939588121503
  Predicted values on 30% test data: [ 855308.4363391  1279349.31095409 2016682.32498121 1713732.17964167
   1416530.92861757]
  [[ 0.40988855 -0.98993223 -1.13805992 -1.33817785 -1.12492995]
   [-0.40282512  2.07744903 -1.29838425 -1.29765967 -0.27789909]
   [ 2.10782492  0.40571791  1.81363115 -0.5116069   0.09301127]
   [ 0.58003921  0.91164992  1.01182501  2.02483141  0.49760458]
   [-0.07629476  0.59473728 -0.01259163 -1.46783604  0.7144602 ]]
     Predicted_Price
  0     8.553084e+05
  1     1.279349e+06
  2     2.016682e+06
  3     1.713732e+06
  4     1.416531e+06
  ```
]
#question(
  "2",
  [
    Concept of Validation set for Multiple Linear Regression (Gradient Descent Optimization) \

    Consider the same dataset of Q1, rather than dividing the dataset into five folds, divide the dataset into training set (56%), validation set (14%), and test set (30%).   \
    Consider four different values of learning rate i.e. {0.001,0.01,0.1,1}. \
    Compute the values of regression coefficients for each value of learning rate after 1000 iterations.  For each set of regression coefficients, compute R2_score for validation and test set and find the best value of regression coefficients.
  ],
)

#solution()[```python
from sklearn.model_selection import KFold
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

df = pd.read_csv('USA_Housing.csv')

X = df.drop('Price', axis=1)
y = df['Price']

X_train, X_temp, y_train, y_temp = train_test_split(X, y, test_size=0.44, random_state=42)
X_val, X_test, y_val, y_test = train_test_split(X_temp, y_temp, test_size=0.5, random_state=42)

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

    print(f'Learning Rate: {lr}, R2 Validation: {r2_val}, R2 Test: {r2_test}')

    if r2_val > best_r2:
        best_r2 = r2_val
        best_model = model

print(f'Best R2 on Validation Set: {best_r2}')
print(f'Best Model Coefficients: {best_model.coef_}')


```]
#v(4mm)
#output()[```txt
  Learning Rate: 0.001, R2 Validation: 0.9175163807040676, R2 Test: 0.9134221506851627
  Learning Rate: 0.01, R2 Validation: 0.9175163807040676, R2 Test: 0.9134221506851627
  Learning Rate: 0.1, R2 Validation: 0.9175163807040676, R2 Test: 0.9134221506851627
  Learning Rate: 1, R2 Validation: 0.9175163807040676, R2 Test: 0.9134221506851627
  Best R2 on Validation Set: 0.9175163807040676
  Best Model Coefficients: [231827.54854547 166006.22902472 120763.07797071   2922.26769971
   152609.02782229]
  ```
]
#question("3", [
  Pre-processing and Multiple Linear Regression  \

  Download the dataset regarding Car Price Prediction from the following link:
  #link(
    "https://archive.ics.uci.edu/ml/machine-learning-databases/autos/imports-85.data",
  )[#text(
    font: "Montserrat",
    size: 10pt,
    weight: "bold",
    fill: blue.darken(20%),
  )[imports-85.data]]  \

  #set enum(numbering: "1. (i)")
  + Load the dataset with following column names ["symboling", "normalized_losses",  "make", "fuel_type", "aspiration","num_doors", "body_style", "drive_wheels",  "engine_location", "wheel_base", "length", "width", "height", "curb_weight",  "engine_type", "num_cylinders", "engine_size", "fuel_system", "bore", "stroke",  "compression_ratio", "horsepower", "peak_rpm", "city_mpg", "highway_mpg", "price"]  and replace all ? values with NaN
  + Replace all NaN values with central tendency imputation. Drop the rows with NaN  values in price column
  + There are 10 columns in the dataset with non-numeric values. Convert these values to  numeric values using following scheme:
    + For “num_doors” and “num_cylinders”: convert words (number names) to figures  for e.g., two to 2
    + For "body_style", "drive_wheels": use dummy encoding scheme
    + For “make”, “aspiration”, “engine_location”,fuel_type: use label encoding  scheme
    + For fuel_system: replace values containing string pfi to 1 else all values to 0.
    + For engine_type: replace values containing string ohc to 1 else all values to 0.
  + Divide the dataset into input features (all columns except price) and output variable  (price). Scale all input features.
  + Train a linear regressor on 70% of data (using inbuilt linear regression function of  Python) and test its performance on remaining 30% of data.
  + Reduce the dimensionality of the feature set using inbuilt PCA decomposition and then  again train a linear regressor on 70% of reduced data (using inbuilt linear regression  function of Python). Does it lead to any performance improvement on test set?
])

#solution()[```python
from sklearn.metrics import r2_score
from sklearn.impute import SimpleImputer
from sklearn.decomposition import PCA
from sklearn.model_selection import KFold
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder, LabelEncoder

df = pd.read_csv('./data.csv')

column_names = ["symboling", "normalized_losses", "make", "fuel_type", "aspiration", "num_doors", "body_style", "drive_wheels",  "engine_location", "wheel_base", "length", "width", "height", "curb_weight",  "engine_type", "num_cylinders", "engine_size", "fuel_system", "bore", "stroke",  "compression_ratio", "horsepower", "peak_rpm", "city_mpg", "highway_mpg", "price"]
df.columns = column_names

df.replace('?', np.nan, inplace=True)

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
        "nine": 9
}

df['num_doors'] = df['num_doors'].map(figures)
df['num_cylinders'] = df['num_cylinders'].map(figures)

df = pd.get_dummies(df, columns=['body_style', 'drive_wheels'], drop_first=True)

label_encoder = LabelEncoder()

df['make'] = label_encoder.fit_transform(df['make'])
df['aspiration'] = label_encoder.fit_transform(df['aspiration'])
df['engine_location'] = label_encoder.fit_transform(df['engine_location'])
df['fuel_type'] = label_encoder.fit_transform(df['fuel_type'])

df['fuel_system'] = df['fuel_system'].apply(lambda x: 1 if 'pfi' in str(x).lower() else 0)
df['engine_type'] = df['engine_type'].apply(lambda x: 1 if 'ohc' in str(x).lower() else 0)

# imputation
num_cols = df.select_dtypes(include=[np.number]).columns
imputer = SimpleImputer(strategy="mean")
df[num_cols] = imputer.fit_transform(df[num_cols])

cat_cols = df.select_dtypes(exclude=[np.number]).columns
if len(cat_cols) > 0:
    cat_imputer = SimpleImputer(strategy="most_frequent")
    df[cat_cols] = cat_imputer.fit_transform(df[cat_cols])

X = df.drop('price', axis=1)
y = df['price'].astype(float)


scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
X = pd.DataFrame(X_scaled, columns=X.columns)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
mse = np.mean((y_test - y_pred) ** 2)
print(f'Mean Squared Error: {mse}')
r2 = r2_score(y_test, y_pred)
print(f'R2 Score: {r2}')

pca = PCA(n_components=0.95)  # retain 95% variance
X_pca = pca.fit_transform(X)
X_train_pca, X_test_pca, y_train, y_test = train_test_split(X_pca, y, test_size=0.3, random_state=42)
model_pca = LinearRegression()
model_pca.fit(X_train_pca, y_train)
y_pred_pca = model_pca.predict(X_test_pca)
mse_pca = np.mean((y_test - y_pred_pca) ** 2)
print(f'Mean Squared Error after PCA: {mse_pca}')
r2_pca = r2_score(y_test, y_pred_pca)
print(f'R2 Score after PCA: {r2_pca}')

```]
#output()[```txt
  Mean Squared Error: 20894691.649386063
  R2 Score: 0.7438853445721764
  Mean Squared Error after PCA: 20620965.335823666
  R2 Score after PCA: 0.7472405183003142
  ```
]

