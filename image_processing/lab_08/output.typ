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
    fill: blue.lighten(90%),
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

#title("Assignment 8")
#question(
  "1",
  [Implement the following Morphological Operations using OpenCV in Python:],
)

#solution()[```python
import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("./gray_original.png", cv2.IMREAD_GRAYSCALE)

kernel = np.ones((5, 5), np.uint8)
erosion = cv2.erode(img, kernel, iterations=1)

dilation = cv2.morphologyEx(img, cv2.MORPH_DILATE, kernel)

opening = cv2.morphologyEx(img, cv2.MORPH_OPEN, kernel)

closing = cv2.morphologyEx(img, cv2.MORPH_CLOSE, kernel)


def lbp(image):
    lbp_image = np.zeros_like(image)
    for i in range(1, image.shape[0] - 1):
        for j in range(1, image.shape[1] - 1):
            center = image[i, j]
            binary_string = ""
            binary_string += "1" if image[i - 1, j - 1] >= center else "0"
            binary_string += "1" if image[i - 1, j] >= center else "0"
            binary_string += "1" if image[i - 1, j + 1] >= center else "0"
            binary_string += "1" if image[i, j + 1] >= center else "0"
            binary_string += "1" if image[i + 1, j + 1] >= center else "0"
            binary_string += "1" if image[i + 1, j] >= center else "0"
            binary_string += "1" if image[i + 1, j - 1] >= center else "0"
            binary_string += "1" if image[i, j - 1] >= center else "0"
            lbp_value = int(binary_string, 2)
            lbp_image[i, j] = lbp_value
    return lbp_image


lbp_image = lbp(img)

plt.subplot(2, 3, 1)
_ = plt.imshow(img, cmap="gray")
_ = plt.title("Original Image")
_ = plt.axis("off")

plt.subplot(2, 3, 2)
_ = plt.imshow(erosion, cmap="gray")
_ = plt.title("Eroded Image")
_ = plt.axis("off")

plt.subplot(2, 3, 3)
_ = plt.imshow(dilation, cmap="gray")
_ = plt.title("Dilated Image")
_ = plt.axis("off")

plt.subplot(2, 3, 4)
_ = plt.imshow(lbp_image, cmap="gray")
_ = plt.title("LBP Image")
_ = plt.axis("off")

plt.subplot(2, 3, 5)
_ = plt.imshow(opening, cmap="gray")
_ = plt.title("Opened Image")
_ = plt.axis("off")

plt.subplot(2, 3, 6)
_ = plt.imshow(closing, cmap="gray")
_ = plt.title("Closed Image")
_ = plt.axis("off")

plt.tight_layout()
plt.show()
```]
#output()[```txt
  <Figure size 640x480 with 6 Axes>
  ```
]
#align(center)[#image("images/cell_1.png", width: 80%)]
