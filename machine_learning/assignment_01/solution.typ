#import "./temp2.typ": *

#set enum(numbering:"i.")

#title("Question 1")
#question()[Reverse the NumPy array: `arr = np.array([1, 2, 3, 6, 4, 5])`]

#solution(output: [
  ```txt
  [5 4 6 3 2 1]
  ```
])[```python
arr = np.array([1, 2, 3, 6, 4, 5])
arr = arr[::-1]
print(arr)
```]

#question()[Flatten the NumPy arr: `array1 = np.array([[1, 2, 3], [2, 4, 5], [1, 2, 3]])` using any two NumPy in-built methods]
#solution(output: [
  ```txt
  [1 2 3 2 4 5 1 2 3]
  ```
])[```python
arr = np.array([[1,2,3], [2, 4, 5], [1, 2, 3]])
arr = arr.flatten()
print(arr)
```]

#question()[Compare the following numpy arrays \
```python
arr1 = np.array([[1, 2], [3, 4]])
arr2 = np.array([[1, 2], [3, 4]])
```
]

#solution(output: [
  ```txt
  [[ True  True]
  [ True  True]]
  ```
])[```python
arr1 = np.array([[1, 2,], [3, 4]])
arr2 = np.array([[1, 2], [3, 4]])

print(arr1 == arr2)
```]

#question()[Find the most frequent value and their indice(s) in the following arrays:
+ `x = np.array([1,2,3,4,5,1,2,1,1,1]`
+ `y = np.array([1, 1, 1, 2, 3, 4, 2, 4, 3, 3, ])`
]

#solution(output: [
  ```txt
  1
  3
  ```
])[
  ```python
  x = np.array([1, 2, 3, 4, 5, 1, 2, 1, 1, 1])
  y = np.array([1, 21, 1, 2, 3, 4, 2, 4, 3, 3])

  counts = {}
  for i in x:
      counts[i] = counts.get(i, 0) + 1
  print(max(counts, key=counts.get))

  counts = {}
  for i in y:
      counts[i] = counts.get(i, 0) + 1
  print(max(counts, key=counts.get))
  ```
]

#question()[For the array `gfg = np.matrix('[4, 1, 9; 12, 3, 1; 4, 5, 6]')`, find
  + Sum of all elements
  + Sum of all elements, row-wise
  + Sum of all elements, column-wise
]

#solution(output: [
  ```txt
  45
  [[20  9 16]]
  [[14]
   [16]
   [15]]
  ```
])[
  ```python
  gfg = np.matrix('[4, 1, 9; 12, 3, 1; 4, 5, 6]')
  print(np.sum(gfg))
  print(np.sum(gfg, axis=0))
  print(np.sum(gfg, axis=1))
  ```
]

#question()[
  For the matrix: `n_array = np.array([[55, 25, 15],[30, 44, 2],[11, 45, 77]])`, find

  + Sum of diagonal elements
  + Eigen values of matrix
  + Eigen vectors of matrix
  + Inverse of matrix
  + Determinant of matrix
]

#solution()[
  ```python
  n_array = np.array([[55, 25, 15], [30, 44, 2], [11, 45, 77]])
  print(np.trace(n_array))
  eigenvalues, eigenvectors = np.linalg.eig(n_array)
  print("Eigenvalues:", eigenvalues)
  print("Eigenvectors:\n", eigenvectors)
  inverse = np.linalg.inv(n_array)
  print("Inverse of the matrix:\n", inverse)
  det = np.linalg.det(n_array)
  ```
]

#question()[
  Multiply the following matrices and also find covariance between matrices using NumPy:

  + ```
  p = [[1, 2], [2, 3]]
  q = [[4, 5], [6, 7]]
  ```

  + ```
  p = [[1, 2], [2, 3], [4, 5]]
  q = [[4, 5, 1], [6, 7, 2]
  ```

]

#solution()[
  ```python
  p = np.array([[1, 2], [2, 3]])
  q = np.array([[4, 5], [6, 7]])

  product = np.multiply(p, q)
  covariance = np.cov(p, q, rowvar=False)

  print( product)
  print(covariance)

  ```
]


#question()[
  For the matrices: `x = np.array([[2, 3, 4], [3, 2, 9]])`; `y = np.array([[1, 5, 0], [5, 10, 3]])`, find inner, outer and cartesian product?
]

#solution()[
  ```python
  x = np.array([[2, 3, 4], [3, 2, 9]])
  y = np.array([[1, 5, 0], [5, 10, 3]])

  inner_product = np.inner(x, y)
  outer_product = np.outer(x, y)

  print("Inner Product:\n", inner_product)
  print("Outer Product:\n", outer_product)

  ```
]

#pagebreak()

#title("Question 2")
#question()[
  For the array: `array = np.array([[1, -2, 3],[-4, 5, -6]])`
  + Find element-wise absolute value
  + Find the 25th, 50th, and 75th percentile of flattened array, for each column, for each row.
  + Mean, Median and Standard Deviation of flattened array, of each column, and each row
]

#solution()[
  ```python
  arr = np.array([[1, -2, 3], [-4, 5, -6]])

  abs_values = np.abs(arr)
  print(abs_values)

  perc_25_row = np.percentile(arr, 25, axis=1)
  perc_25_col = np.percentile(arr, 25, axis=0)
  print(perc_25_row)
  print(perc_25_col)

  perc_50_row = np.percentile(arr, 50, axis=1)
  perc_50_col = np.percentile(arr, 50, axis=0)
  print(perc_50_row)
  print(perc_50_col)

  perc_75_row = np.percentile(arr, 75, axis=1)
  perc_75_col = np.percentile(arr, 75, axis=0)
  print(perc_75_row)
  print(perc_75_col)

  flattened_arr = arr.flatten()
  print(np.mean(flattened_arr))
  print(np.median(flattened_arr))
  print(np.std(flattened_arr))

  ```
]

#question()[
  For the array: a = np.array([-1.8, -1.6, -0.5, 0.5,1.6, 1.8, 3.0]). Find floor, ceiling and truncated value, rounded values
]

#solution()[
  ```python
  a = np.array([-1.8, -1.6, -0.5, 0.5, 1.6, 1.8, 3.0])
  floor_values = np.floor(a)
  ceil_values = np.ceil(a)
  trunc_values = np.trunc(a)
  rounded_values = np.round(a)

  print(floor_values)
  print(ceil_values)
  print(trunc_values)
  print(rounded_values)
  ```
]

#title("Question 3")
#question()[
  For the array: `array = np.array([10, 52, 62, 16, 16, 54, 453])`, find
  + Sorted array
  + Indices of sorted array
  + 4 smallest elements
  + 5 largest elements
]

#solution()[
  ```python
  arr = np.array([10, 52, 62, 16, 16, 54, 453])
  sorted_arr = np.sort(arr)

  print(sorted_arr)
  print(sorted_arr[:4])
  print(sorted_arr[::-1][:5])
  ```
]

#question()[
  For the array: `array = np.array([1.0, 1.2, 2.2, 2.0, 3.0, 2.0])`, find
  + Integer elements only
  + Float elements only
]

#solution()[
  ```python
  arr = np.array([1.0, 1.2, 2.2, 2.0, 3.0, 2.0])
  print(arr)

  arr_int = [i for i in arr if i.is_integer()]
  print(arr_int)

  arr_float = [i for i in arr if i.is_integer() is False]
  print(arr_float)
  ```
]

#pagebreak()

#title("Question 4")
#question()[
  Write a function named img_to_array(path) that reads an image from a specified path and save it as text file on local machine? (Note: use separate cases for RGB and Grey Scale images)
]

#solution()[
  ```python
  import numpy as np
  import cv2

  def img_to_array(path):
      img = cv2.imread(path)
      with open(f"{path}.txt", "a+") as f:
          f.write(str(img))

  img_to_array("./screenshots.png")
  ```
]
