#import "@preview/showybox:2.0.4": showybox

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: olive,
    stroke: 1pt + olive,
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
      border-color: olive,
      title-color: olive,
      body-color: olive.lighten(90%),
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
    stroke: (thickness: 1.3pt, dash: "dashed", paint: olive),
    fill: olive.lighten(90%),
  )[
    #text(
      weight: "bold",
      size: 9pt,
      fill: olive,
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
      fill: olive,
      font: "Montserrat",
    )[#smallcaps()[Output]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#title("Assignment 5")
#question(
  "1",
  [Build a Convolutional Neural Network to predict digits using the MNIST datasets],
)

#solution()[```python
import tensorflow as tf
from tensorflow.keras import datasets, layers, models

(x_train, y_train), (x_test, y_test) = datasets.mnist.load_data()

x_train = x_train.reshape((x_train.shape[0], 28, 28, 1))
x_test = x_test.reshape((x_test.shape[0], 28, 28, 1))

x_train, x_test = x_train / 255.0, x_test / 255.0

model = models.Sequential([
    layers.Conv2D(32, (3,3), activation='relu', input_shape=(28, 28, 1)),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(64, (3,3), activation='relu'),
    layers.MaxPooling2D((2, 2)),
    layers.Flatten(),
    layers.Dense(64, activation='relu'),
    layers.Dense(10, activation='softmax')
])

model.compile(
    optimizer='adam',
    loss='sparse_categorical_crossentropy',
    metrics=['accuracy']
)

model.fit(
    x_train, y_train, epochs=5, batch_size=64, validation_split=0.1
)

test_loss, test_acc = model.evaluate(x_test, y_test, verbose=2)
print('\nTest accuracy:', test_acc)

```]
#output()[```txt
  Downloading data from https://storage.googleapis.com/tensorflow/tf-keras-datasets/mnist.npz
  11490434/11490434 ━━━━━━━━━━━━━━━━━━━━ 3s 0us/step
  Epoch 1/5
  2025-09-02 08:59:27.902675: W external/local_xla/xla/tsl/framework/cpu_allocator_impl.cc:84] Allocation of 169344000 exceeds 10% of free system memory.
  844/844 ━━━━━━━━━━━━━━━━━━━━ 22s 24ms/step - accuracy: 0.9458 - loss: 0.1785 - val_accuracy: 0.9833 - val_loss: 0.0576
  Epoch 2/5
  844/844 ━━━━━━━━━━━━━━━━━━━━ 19s 23ms/step - accuracy: 0.9821 - loss: 0.0559 - val_accuracy: 0.9878 - val_loss: 0.0454
  Epoch 3/5
  844/844 ━━━━━━━━━━━━━━━━━━━━ 21s 23ms/step - accuracy: 0.9881 - loss: 0.0380 - val_accuracy: 0.9853 - val_loss: 0.0528
  Epoch 4/5
  844/844 ━━━━━━━━━━━━━━━━━━━━ 19s 23ms/step - accuracy: 0.9906 - loss: 0.0295 - val_accuracy: 0.9895 - val_loss: 0.0392
  Epoch 5/5
  844/844 ━━━━━━━━━━━━━━━━━━━━ 19s 23ms/step - accuracy: 0.9925 - loss: 0.0235 - val_accuracy: 0.9897 - val_loss: 0.0365
  313/313 - 1s - 4ms/step - accuracy: 0.9889 - loss: 0.0361

  Test accuracy: 0.9889000058174133
  ```
]
