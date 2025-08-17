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
        #question("1.",[ (a): Reverse the NumPy array: `arr = np.array([1, 2, 3, 6, 4, 5])`])
```python
import numpy as np

arr = np.array([1, 2, 3, 6, 4, 5])
arr = arr[::-1]
print(arr)
```
=== Output
```txt
[5 4 6 3 2 1]

``` #question("1.",[ (b): Flatten the NumPy arr: `array1 = np.array([[1, 2, 3], [2, 4, 5], [1, 2, 3]])` using any two 
NumPy in-built methods])
```python
arr = np.array([[1,2,3], [2, 4, 5], [1, 2, 3]])
arr = arr.flatten()
print(arr)
```
=== Output
```txt
[1 2 3 2 4 5 1 2 3]

``` #question("1.",[ (c): Compare the following numpy arrays: 
`arr1 = np.array([[1, 2], [3, 4]])`
`arr2 = np.array([[1, 2], [3, 4]])`])
```python
arr1 = np.array([[1, 2,], [3, 4]])
arr2 = np.array([[1, 2], [3, 4]])

print(arr1 == arr2)
```
=== Output
```txt
[[ True  True]
 [ True  True]]

``` ```python

```
