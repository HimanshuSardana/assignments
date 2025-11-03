# coding: utf-8
import numpy as np
arr = np.array([1, 2, 3, 6, 4, 5])
arr = arr[::-1]
print(arr)
arr = np.array([[1,2,3], [2, 4, 5], [1, 2, 3]])
arr = arr.flatten()
print(arr)
arr1 = np.array([[1, 2,], [3, 4]])
arr2 = np.array([[1, 2], [3, 4]])

print(arr1 == arr2)
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
