#import "@preview/showybox:2.0.4": showybox

#let question(number, body) = context [
  #showybox(
    frame: (
      border-color: blue,
      title-color: blue,
      body-color: white,
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
      #smallcaps()[#text(size: 10pt, weight: "bold")[
          == Question #number
        ]]
    ],
  )[#body
    #v(1mm)
  ]
]
        #question("1",[Negative Image transformation])
```python
import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("gray_image.jpg")

# Apply negative transformation
negative_img = img - np.max(img)
print(np.max(img))

cv2.imwrite("negative.jpg", negative_img)
```
=== #smallcaps()[Output]
```txt
255
True
```
#question("2",[Log image transformation])
```python
import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("gray_image.jpg")

img = img.astype(np.float32)

c = 255 / np.log(1 + np.max(img))
log_img = np.uint8(c * np.log1p(img))

cv2.imwrite("log_img.jpg", log_img)
```
=== #smallcaps()[Output]
```txt
True
```
#question("3",[Make a custom 3x3 image and repeatedly apply the log transform])
```python
new_img = (np.random.rand(3, 3) * 255).astype(np.uint8)
plt.imshow(new_img)

for i in range(10):
    c = 255 / np.log(1 + float(np.max(new_img)))
    log_img = np.uint8(c * np.log1p(new_img))

    print(log_img)

    cv2.imwrite(f"{i}.jpg", log_img)
    print(f"Wrote image {i}.jpg")
    new_img = log_img
```
=== #smallcaps()[Output]
```txt
[[224 241 218]
 [206 193 148]
 [255 242 214]]
Wrote image 0.jpg
[[249 252 247]
 [245 242 230]
 [255 252 246]]
Wrote image 1.jpg
[[253 254 253]
 [253 252 250]
 [255 254 253]]
Wrote image 2.jpg
[[254 254 254]
 [254 254 254]
 [255 254 254]]
Wrote image 3.jpg
[[254 254 254]
 [254 254 254]
 [255 254 254]]
Wrote image 4.jpg
[[254 254 254]
 [254 254 254]
 [255 254 254]]
Wrote image 5.jpg
[[254 254 254]
 [254 254 254]
 [255 254 254]]
Wrote image 6.jpg
[[254 254 254]
 [254 254 254]
 [255 254 254]]
Wrote image 7.jpg
[[254 254 254]
 [254 254 254]
 [255 254 254]]
Wrote image 8.jpg
[[254 254 254]
 [254 254 254]
 [255 254 254]]
Wrote image 9.jpg
<Figure size 640x480 with 1 Axes>
```
#align(center)[#image("images/cell_1.png", width: 80%)]
#question("3",[Power Log (Gamma Correction) image transformation])
```python
import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("gray_image.jpg")

gamma = 0.3
c = 1.0

norm_img = img / 255

power_log_img = c * np.power(norm_img, gamma)
plt.imshow(power_log_img)
```
=== #smallcaps()[Output]
```txt
<matplotlib.image.AxesImage at 0x7fd38e87d790><Figure size 640x480 with 1 Axes>
```
#align(center)[#image("images/cell_2.png", width: 80%)]
#question("5",[Contrast Stretching Transformation])
```python
import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("img1.jpg").astype(np.float32)

r1, r2 = 80, 120
s1, s2 = 50, 150

mask = (img >= r1) & (img <= r2)

img[mask] = ((img[mask] - 1) / (r2 - r1)) * (s2 - s1) + s1
img = np.clip(img, 0, 255).astype(np.float32)
plt.imshow(img)
```
=== #smallcaps()[Output]
```txt
Clipping input data to the valid range for imshow with RGB data ([0..1] for floats or [0..255] for integers). Got range [0.0..255.0].
<matplotlib.image.AxesImage at 0x7fd38e089c90><Figure size 640x480 with 1 Axes>
```
#align(center)[#image("images/cell_3.png", width: 80%)]
```python

```
