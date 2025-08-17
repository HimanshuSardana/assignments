import numpy as np

# (a)
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

# (b)
a = np.array([-1.8, -1.6, -0.5, 0.5, 1.6, 1.8, 3.0])
floor_values = np.floor(a)
ceil_values = np.ceil(a)
trunc_values = np.trunc(a)
rounded_values = np.round(a)

print(floor_values)
print(ceil_values)
print(trunc_values)
print(rounded_values)

