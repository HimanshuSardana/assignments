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
        #question("1",[ Add 2 images])
```python
import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

alpha = 0.5
beta = 1 - alpha
img = cv2.addWeighted(img1, alpha, img2, beta, 0)

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
```
=== Output
```txt
<matplotlib.image.AxesImage at 0x7f934b62e7d0><Figure size 640x480 with 1 Axes>
``` #question("2",[ Subtract 2 images])
```python
import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = cv2.subtract(img1, img2)

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)

```
=== Output
```txt
<matplotlib.image.AxesImage at 0x7f934b5558d0><Figure size 640x480 with 1 Axes>
``` #question("3",[ Multiply 2 images])
```python
import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = cv2.multiply(img1, img2, scale=1.0/255.0)

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
```
=== Output
```txt
<matplotlib.image.AxesImage at 0x7f934b57d8d0><Figure size 640x480 with 1 Axes>
``` #question("4",[ Divide 2 images])
```python
import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = np.array(img1, dtype=np.float32)/np.array(img2, dtype=np.float32)

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
```
=== Output
```txt
/tmp/ipykernel_3113/2660822262.py:10: RuntimeWarning: divide by zero encountered in divide
  img = np.array(img1, dtype=np.float32)/np.array(img2, dtype=np.float32)
/tmp/ipykernel_3113/2660822262.py:10: RuntimeWarning: invalid value encountered in divide
  img = np.array(img1, dtype=np.float32)/np.array(img2, dtype=np.float32)
Clipping input data to the valid range for imshow with RGB data ([0..1] for floats or [0..255] for integers). Got range [0.0..255.0].
<matplotlib.image.AxesImage at 0x7f934b486890><Figure size 640x480 with 1 Axes>
``` #question("5",[ AND 2 images])
```python
import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = np.bitwise_and(np.array(img1, dtype=np.uint8), np.array(img2, dtype=np.uint8))

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
```
=== Output
```txt
<matplotlib.image.AxesImage at 0x7f934b305250><Figure size 640x480 with 1 Axes>
``` #question("6",[ NOT 2 images])
```python
import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = np.bitwise_not(np.array(img1, dtype=np.uint8), np.array(img2, dtype=np.uint8))

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
```
=== Output
```txt
<matplotlib.image.AxesImage at 0x7f934b3857d0><Figure size 640x480 with 1 Axes>
``` #question("&",[ OR 2 images])
```python
import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = np.bitwise_or(np.array(img1, dtype=np.uint8), np.array(img2, dtype=np.uint8))

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
```
=== Output
```txt
<matplotlib.image.AxesImage at 0x7f934b1f7ad0><Figure size 640x480 with 1 Axes>
``` ```python

```
