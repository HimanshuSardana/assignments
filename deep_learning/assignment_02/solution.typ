// #set page(columns: 2)
#let assignment_no = state("assignment_no", 2);
#show raw.where(block: true): it => [
  #set text(font: "Iosevka NF")
  #block(width: 100%, fill: gray.lighten(90%), inset: 8pt)[
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

= Logistic Regression

#question()[
  Implement single layer perceptron for glass classification.

  Link for dataset #underline()[#link("https://www.kaggle.com/datasets/uciml/glass https://medium.com/analytics-vidhya/logistic-regression-using-single-layer-perceptron-neural-network-slpnn-31757c792d5d")[Click Here]]

]

#block(breakable: true)[
  #smallcaps()[*Solution*]

  == EDA
  ```python
  print(df["Type"].value_counts())
  ```

  ```txt
  Type
  2    76
  1    70
  7    29
  3    17
  5    13
  6     9
  Name: count, dtype: int64
  ```

  Converting `glass_type` 1, 2, 3 to "0"

  Converting `glass_type` 5, 6, 7 to "1"
  ```python
  df["Window"] = df["Type"].map({1: 0, 2: 0, 3: 0, 4: 0, 5: 1, 6: 1, 7: 1})
  ```

  ```txt
  Window
  0    163
  1     51
  Name: count, dtype: int64
  ```
  == Selecting Input Features
  Possible Columns: \
  // Index(['RI', 'Na', 'Mg', 'Al', 'Si', 'K', 'Ca', 'Ba', 'Fe', 'Type', 'Window'], dtype='object')
  #box(width: 50%)[
    #grid(columns: (1fr, 1fr, 1fr))[
      + RI
      + Na
      + Mg
    ][
      + Al
      + Si
      + K
    ][
      + Ca
      + Ba
      + Fe
    ]
  ]

  Picking the following 4 columns:
  ```python
  iv = ["RI", "Mg", "Al", "K"]
  X = df[iv].values
  y = df["Window"].values
  ```

  == Defining the Logistic Regression MLP Class
  ```python
  class LogisticRegressionSinglePerceptronModel:
    def __init__(self, eta, inputLayer, outputLayer):
        self.eta = eta
        self.inputLayer = inputLayer
        self.outputLayer = outputLayer
        self.w = np.random.randn(self.inputLayer, self.outputLayer)
        self.delta_E_w = np.zeros((self.inputLayer, self.outputLayer))
        self.E = np.array([])
        self.w_list = []

    iv = ["RI", "Na", "Mg", "Al", "Si", "K", "Ca", "Ba", "Fe"]
    X = df[iv].values

    def sigmoid(self, x):
        return 1 / (1 + np.exp(-x))

    def feedforward(self, X):
        z = np.dot(X, self.w)
        h = self.sigmoid(z)
        return h

    def error(self, h, y):
        error = (-y * np.log(h) - (1 - y) * np.log(1 - h)).mean()
        self.E = np.append(self.E, error)

    def backprop(self, X, y, h):
        self.delta_E_w = np.dot(X.T, h - y) / self.outputLayer
        self.w_list.append(self.w)
        self.w = self.w - eta * self.delta_E_w

    def predict(self, X):
        pred = self.feedforward(X)
        return pred

    def classify(self, y):
        return self.predict(y).round()

    def train(self, X, y):
        for epoch in range(epochs):
            h = self.feedforward(X)
            self.backprop(X, y, h)
            self.error(h, y)
  ```

  == Training the Model
  ```python
  eta = 0.001
  epochs = 10000
  inputLayer = X.shape[1]
  outputLayer = 1

  SPNN = LogisticRegressionSinglePerceptronModel(eta, inputLayer, outputLayer)
  SPNN.train(X, y)
  pred = SPNN.predict(X)
  pred2 = SPNN.classify(X)
  print("Minimum Error achieved:", min(SPNN.E))
  ```

  #smallcaps()[*Output*]
  ```txt
  Minimum Error achieved: 0.00015751192266478202
  ```

]
