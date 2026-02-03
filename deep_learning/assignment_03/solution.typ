// #set page(columns: 2)
#let assignment_no = state("assignment_no", 3);
#show raw.where(block: true): it => [
  #set text(font: "Iosevka NF")
  #block(width: 100%, fill: gray.lighten(85%), inset: 8pt)[
    #it
  ]
]
#show heading.where(level: 1): it => [
  #place(top + center, float: true, scope: "parent")[
    #box(width: 100%, stroke: 1pt, height: 70pt)[
      #place(top + right, float: true, dy: 14mm, dx: -10mm)[
        #text(fill: gray.darken(30%), size: 16pt)[
          #smallcaps()[Assignment #assignment_no.get()]
        ]
      ]
      #place(bottom + right, float: true, dy: 2mm, dx: -5mm)[
        #box(fill: white, inset: (x: 10pt))[
          #text(weight: "bold", size: 24pt)[
            #smallcaps(it.body)
          ]
        ]
      ]
    ]
  ]
]

#let question(body) = [
  #place(top, scope: "parent", float: true)[
    #box(width: 100%, stroke: 1pt, inset: (x: 10pt, y: 10pt))[
      #place(top + left, float: true, dy: -6mm, scope: "parent")[
        #box(fill: white, inset: (x: 8pt, y: 4pt))[
          #text(weight: "bold")[
            #smallcaps()[Question 1]
          ]
        ]
      ]
      #v(-10mm)
      #set text(size: 10pt)
      #body
    ]

  ]
]

#let cbo(c, output) = [
  #block(breakable: true, width: 100%, fill: gray.lighten(85%), inset: 8pt)[
    #set text(font: "Iosevka NF")
    #grid(columns: 2fr)[
      #block(width: 100%)[
        #text(size: 8pt, weight: "bold", fill: gray)[Code] \
        #c
      ]
    ][
      #box(
        height: auto,
        fill: gray.lighten(85%),
      )[
        \
        #text(size: 8pt, weight: "bold", fill: gray)[Output] \
        #output
      ]
    ]
  ]
]

= Linear Regression

#question()[
  Implement Linear Regression for income prediction on the basis of age and experience.

  Link for dataset #underline()[#link("https://www.kaggle.com/datasets/hussainnasirkhan/multiple-linear-regression-dataset")[Click Here]]
]

#block(breakable: true)[
  #smallcaps()[*Solution*]

  == EDA
  #cbo()[
    ```python
    df = pd.read_csv('./multiple_linear_regression_dataset.csv')
    df.head()
    ```
  ][
    ```txt
    age  experience  income
    0   25           1   30450
    1   30           3   35670
    2   47           2   31580
    3   32           5   40130
    4   43          10   47830
    ```
  ]


  #cbo()[
    ```python
    # number of rows
    len(df)
    ```
  ][
    ```txt
    20
    ```
  ]

  == Preparing Data
  #cbo()[
    ```python
    X = df.drop(columns=["income"]).values.astype(float)
    y = df["income"].values.astype(float)

    X_mean = X.mean(axis=0)
    X_std = X.std(axis=0)
    X = (X - X_mean) / X_std

    y_mean = y.mean()
    y_std = y.std()
    y = (y - y_mean) / y_std

    X = np.hstack([np.ones((X.shape[0], 1)), X])
    ```
  ][
    ```txt
    ```
  ]


]

== Implementing Linear Regression
#cbo()[
  ```python
  class LinearRegressionModel:
    def __init__(self, eta, inputLayer):
        self.eta = eta
        self.w = np.random.randn(inputLayer, 1) * 0.01
        self.losses = []

    def feedforward(self, X):
        return X @ self.w

    def compute_loss(self, y_pred, y_true):
        return np.sqrt(np.mean((y_pred - y_true) ** 2))

    def backprop(self, X, y_true, y_pred):
        n = X.shape[0]
        grad = (2 / n) * X.T @ (y_pred - y_true)
        self.w -= self.eta * grad

    def train(self, X, y, epochs):
        y = y.reshape(-1, 1)
        for epoch in range(epochs):
            y_pred = self.feedforward(X)
            loss = self.compute_loss(y_pred, y)
            self.losses.append(loss)
            self.backprop(X, y, y_pred)

    def predict(self, X):
        return self.feedforward(X)
  ```
][
  ```txt
  ```
]

== Inferencing
#cbo()[
  ```python
  eta = 0.01
  epochs = 2000
  inputLayer = X.shape[1]
  outputLayer = 1

  model = LinearRegressionModel(eta, inputLayer)
  model.train(X, y, epochs)

  print("Final Weights:\n", model.w)

  y_pred = model.predict(X)

  r2 = r2_score(y.flatten(), y_pred.flatten())
  print("R2 Score:", r2)
  ```
][
  ```txt
  Final Weights:
   [[ 4.63796883e-17]
   [-1.17858604e-01]
   [ 1.05672911e+00]]
  R2 Score: 0.9773361310180698
  ```
]
