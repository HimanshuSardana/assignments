import numpy as np

# (a)
arr = np.array([10, 52, 62, 16, 16, 54, 453])
sorted_arr = np.sort(arr)

print(sorted_arr)
print(sorted_arr[:4])
print(sorted_arr[::-1][:5])

# (b)
arr = np.array([1.0, 1.2, 2.2, 2.0, 3.0, 2.0])
print(arr)

arr_int = [i for i in arr if i.is_integer()]
print(arr_int)

arr_float = [i for i in arr if i.is_integer() is False]
print(arr_float)
