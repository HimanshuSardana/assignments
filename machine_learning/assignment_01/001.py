import numpy as np

# (a)
arr = np.array([1, 2, 3, 6, 4, 5])
arr = arr[::-1]
print(arr)

# (b)
arr = np.array([[1,2,3], [2, 4, 5], [1, 2, 3]])
arr = arr.flatten()
print(arr)

# (c)
arr1 = np.array([[1, 2,], [3, 4]])
arr2 = np.array([[1, 2], [3, 4]])

print(arr1 == arr2)

# (d)
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

# (e)
gfg = np.matrix('[4, 1, 9; 12, 3, 1; 4, 5, 6]')
print(np.sum(gfg))
print(np.sum(gfg, axis=0))
print(np.sum(gfg, axis=1))

# (f)
n_array = np.array([[55, 25, 15], [30, 44, 2], [11, 45, 77]])
print(np.trace(n_array))
eigenvalues, eigenvectors = np.linalg.eig(n_array)
print("Eigenvalues:", eigenvalues)
print("Eigenvectors:\n", eigenvectors)
inverse = np.linalg.inv(n_array)
print("Inverse of the matrix:\n", inverse)
det = np.linalg.det(n_array)

# (g)
p = np.array([[1, 2], [2, 3]])
q = np.array([[4, 5], [6, 7]])

product = np.multiply(p, q)
covariance = np.cov(p, q, rowvar=False)

print( product)
print(covariance)

# (h)
x = np.array([[2, 3, 4], [3, 2, 9]])
y = np.array([[1, 5, 0], [5, 10, 3]])

inner_product = np.inner(x, y)
outer_product = np.outer(x, y)

print("Inner Product:\n", inner_product)
print("Outer Product:\n", outer_product)

