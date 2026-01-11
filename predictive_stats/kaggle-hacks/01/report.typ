= Inspecting Dataset
```txt
   id    f1    f2    f3     f4  ...   f97   f98   f99   f100  target
0   1  1.94  0.71  4.72  -1.88  ... -4.11 -4.11  0.71  -1.88       1
1   2  2.92  1.46  0.13  -8.12  ... -1.76 -1.76  1.46  -8.12      18
2   3 -1.67 -1.01 -0.41  10.73  ...  2.37  2.37 -1.01  10.73      13
```

The dataset has 1000 rows and 101 columns. (100 features + 1 target)

f4 and f100 appear to be identical.

Removing all duplicate columns...
We end up with exactly 50 features after removing duplicates, effectively halving the feature set. (seems deliberate)

No missing values detected in the dataset.

We try PCA to reduce dimensionality and apply Linear Regression on the transformed data.

// Root Mean Squared Error: 5.818851859781276, Columns: 25
// Root Mean Squared Error: 5.814769842210907, Columns: 20
// Root Mean Squared Error: 5.796285595551768, Columns: 10
// Root Mean Squared Error: 5.794223113370102, Columns: 8
// Root Mean Squared Error: 5.814158127960583, Columns: 5

#table(columns: 2)[*Components*][*RMSE*][25][5.8189][20][5.8148][10][5.7963][8][5.7942][5][5.8142]

Applying Elastic Net
```txt
Elastic Net RMSE: 5.752040193992554
```
