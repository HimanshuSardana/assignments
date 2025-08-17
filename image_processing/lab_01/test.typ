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
        ```python
import cv2
```
= Reading images using `imread()` function
```python
img = cv2.imread(r"test.jpg")
print(img)
```
=== Output
```txt
[[[ 76  44   3]
  [ 68  37   0]
  [ 66  34   0]
  ...
  [  6  85  66]
  [  0  46  29]
  [ 17  60  45]]

 [[ 79  46   1]
  [ 73  41   0]
  [ 70  39   0]
  ...
  [ 60 141 122]
  [ 46 106  88]
  [ 60 109  93]]

 [[ 89  56   6]
  [ 87  54   5]
  [ 83  53   6]
  ...
  [ 84 173 153]
  [ 56 127 110]
  [ 64 127 111]]

 ...

 [[  3  46   3]
  [  0  34   0]
  [  0  37   0]
  ...
  [ 14  18  12]
  [  0   5   0]
  [ 19  27  17]]

 [[ 11  47  11]
  [  0  33   0]
  [  0  34   0]
  ...
  [ 15  19  13]
  [ 17  25  15]
  [ 17  25  15]]

 [[ 21  54  20]
  [  4  37   3]
  [  5  37   6]
  ...
  [ 78  82  76]
  [ 89  97  87]
  [ 44  52  42]]]

``` = Getting image height and width
```python
img = cv2.imread(r"test.jpg")
```
```python
# print(img.shape[:2])
print(f"Height: {img.shape[0]}  Width: {img.shape[1]}") 
```
=== Output
```txt
Height: 1000  Width: 1600

``` = Displaying Image
```python
cv2.imshow("image", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
= Extracting RGB Values
```python
B, G, R = img[100][100]
print(f"Red: {R}\nGreen: {G}\nBlue: {B}")
```
=== Output
```txt
Red: 4
Green: 38
Blue: 75

``` ```python
cv2.imshow("image", img[100][100])
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python
B = img[100][100][0]
G = img[100][100][1]
R = img[100][100][2]
print(f"Red: {R}\nGreen: {G}\nBlue: {B}")
```
=== Output
```txt
Red: 4
Green: 38
Blue: 75

``` = Grayscale images
```python
img = cv2.imread("gray_original.png")
```
```python
cv2.imshow("Original", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python
gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
cv2.imshow("Grayscale", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python
cv2.imwrite("gray_greyscale.png", gray_img)
```
=== Output
```txt
True
``` = BGR2RGB
```python
img = cv2.imread("gray_original.png", 1)
```
```python
cv2.imshow("Original", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python
gray_img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
cv2.imshow("Grayscale", gray_img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
= BGR2HSV
```python
img = cv2.imread("test.jpg")
```
```python
cv2.imshow("Original", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python
hsv_img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
cv2.imshow("HSV", hsv_img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
= Splitting R, G, B
```python
img = cv2.imread("test.jpg")
```
```python
B, G, R = cv2.split(img)
```
```python
cv2.imshow("Red", R)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python
cv2.imshow("Blue", B)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python
cv2.imshow("Green", G)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
```python

```
