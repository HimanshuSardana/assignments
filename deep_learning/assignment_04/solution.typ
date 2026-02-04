// #set page(columns: 2)
#let a(url, body) = [
  #link(url)[#body]
]
#let assignment_no = state("assignment_no", 4);
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

#let solution(body) = [
  #place(top, scope: "parent", float: true)[
    #box(width: 100%, stroke: 1pt, inset: (x: 10pt, y: 10pt))[
      #place(top + left, float: true, dy: -6mm, scope: "parent")[
        #box(fill: white, inset: (x: 8pt, y: 4pt))[
          #text(weight: "bold")[
            #smallcaps()[Solution]
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

= Multilayer Perceptron

#question()[
  Implement backpropagation for a simple multilayer perceptron with one hidden layer. Train the network on the #a("https://archive.ics.uci.edu/ml/datasets/Abalone")[Abalone Dataset] to predict the Age of the abalone given its physical measurements.
]

#smallcaps()[*Solution*]
=== EDA
#cbo()[
  #v(-3mm)
  ```python
  import pandas as pd
  import numpy as np

  column_names = [
      "Sex",
      "Length",
      "Diameter",
      "Height",
      "Whole weight",
      "Shucked weight",
      "Viscera weight",
      "Shell weight",
      "Rings",
  ]

  df = pd.read_csv("abalone.data", names=column_names)
  print(df.head())
  print(df.describe())

  ```

][
  #v(-4mm)
  ```txt
      Sex  Length  Diameter  Height  ...  Shucked weight  Viscera weight  Shell weight  Rings
  0   M   0.455     0.365   0.095  ...          0.2245          0.1010         0.150     15
  1   M   0.350     0.265   0.090  ...          0.0995          0.0485         0.070      7
  2   F   0.530     0.420   0.135  ...          0.2565          0.1415         0.210      9
  3   M   0.440     0.365   0.125  ...          0.2155          0.1140         0.155     10
  4   I   0.330     0.255   0.080  ...          0.0895          0.0395         0.055      7

  [5 rows x 9 columns]
            Length     Diameter       Height  ...  Viscera weight  Shell weight        Rings
  count  4177.000000  4177.000000  4177.000000  ...     4177.000000   4177.000000  4177.000000
  mean      0.523992     0.407881     0.139516  ...        0.180594      0.238831     9.933684
  std       0.120093     0.099240     0.041827  ...        0.109614      0.139203     3.224169
  min       0.075000     0.055000     0.000000  ...        0.000500      0.001500     1.000000
  25%       0.450000     0.350000     0.115000  ...        0.093500      0.130000     8.000000
  50%       0.545000     0.425000     0.140000  ...        0.171000      0.234000     9.000000
  75%       0.615000     0.480000     0.165000  ...        0.253000      0.329000    11.000000
  max       0.815000     0.650000     1.130000  ...        0.760000      1.005000    29.000000
  ```
]

=== Data Preprocessing
#cbo()[
  #v(-4mm)
  ```python
  def normalize(X):
    X_min = X.min(axis=0)
    X_max = X.max(axis=0)
    X_norm = (X - X_min) / (X_max - X_min)
    return X_norm

  X = df.drop("Rings", axis=1).values
  X[:, 0] = np.where(X[:, 0] == "M", 0, np.where(X[:, 0] == "F", 1, 2))
  X = normalize(X)
  X = X.astype(np.float64)
  print(X)

  ```
][
  #v(-4mm)
  ```txt
  [[0.         0.51351351 0.5210084  ... 0.15030262 0.1323239  0.14798206]
   [0.         0.37162162 0.35294118 ... 0.06624075 0.06319947 0.06826109]
   [0.5        0.61486486 0.61344538 ... 0.17182246 0.18564845 0.2077728 ]
   ...
   [0.         0.70945946 0.70588235 ... 0.3527236  0.37788018 0.30543099]
   [0.5        0.74324324 0.72268908 ... 0.35642233 0.34298881 0.29347285]
   [0.         0.85810811 0.84033613 ... 0.63517149 0.49506254 0.49177877]]
  ```
]

=== MLP Implementation
```python
class NN:
    def __init__(self, input_size, hidden_size, output_size):
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        self.weights_input_hidden = np.random.rand(input_size, hidden_size)
        self.weight_hidden_output = np.random.rand(hidden_size, output_size)

    def relu(self, x):
        return np.maximum(0, x)

    def relu_derivative(self, x):
        return (x > 0).astype(float)

    def feedforward(self, X):
        self.hidden_layer_input = np.dot(X, self.weights_input_hidden)
        self.hidden_layer_output = self.relu(self.hidden_layer_input)
        self.predicted_output = np.dot(
            self.hidden_layer_output, self.weight_hidden_output
        )

    def backpropagation(self, X, y, learning_rate=0.01):
        delta_output = self.predicted_output - y

        grad_w_ho = self.hidden_layer_output.T.dot(delta_output)

        hidden_error = delta_output.dot(self.weight_hidden_output.T)
        hidden_delta = hidden_error * self.relu_derivative(self.hidden_layer_input)
        grad_w_ih = X.T.dot(hidden_delta)

        self.weight_hidden_output -= learning_rate * grad_w_ho
        self.weights_input_hidden -= learning_rate * grad_w_ih

        return grad_w_ih, grad_w_ho

    def train(self, X, y, epochs, learning_rate):
        for epoch in range(epochs):
            self.feedforward(X)
            self.backpropagation(X, y)
            if epoch % 100 == 0:
                print(
                    f"Epoch {epoch}, Loss: {np.mean(np.square(y - self.predicted_output))}"
                )

        return self.predicted_output
```

=== Inference
#cbo()[
  #v(-4mm)
  ```python
  y = df["Rings"].values.reshape(-1, 1)
  y_min = y.min()
  y_max = y.max()
  y_norm = (y - y_min) / (y_max - y_min)

  X_train, X_test, y_train, y_test = train_test_split(
      X, y_norm, test_size=0.2, random_state=42
  )


  predicted_test = nn.predicted_output
  predicted_test_rescaled = predicted_test * (y_max - y_min) + y_min

  accuracy = np.mean(np.abs(predicted_test_rescaled - (y_test * (y_max - y_min) + y_min)))
  print(f"Mean Absolute Error on test set: {accuracy}")
  ```
][
  #v(-4mm)
  ```txt
  Epoch 0, Loss: 13.520496210026257
  Epoch 100, Loss: 0.11516624009675705
  Epoch 200, Loss: 0.11516624009675705
  Epoch 300, Loss: 0.11516624009675705
  Epoch 400, Loss: 0.11516624009675705
  Epoch 500, Loss: 0.11516624009675705
  Epoch 600, Loss: 0.11516624009675705
  Epoch 700, Loss: 0.11516624009675705
  Epoch 800, Loss: 0.11516624009675705
  Epoch 900, Loss: 0.11516624009675705
  ```
]
