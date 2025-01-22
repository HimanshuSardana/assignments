n = 10
marks = {
    "Maths": [],
    "Science": [],
    "English": [],
    "IT": []
}

for i in range(n):
    marks["Maths"].append(int(input(f"Enter Maths marks for student {i+1}: ")))
    marks["Science"].append(int(input(f"Enter Science marks for student {i+1}: ")))
    marks["English"].append(int(input(f"Enter English marks for student {i+1}: ")))
    marks["IT"].append(int(input(f"Enter IT marks for student {i+1}: ")))

highest = {
    "Maths": max(marks["Maths"]),
    "Science": max(marks["Science"]),
    "English": max(marks["English"]),
    "IT": max(marks["IT"]),
    "Overall": max(max(marks["Maths"]), max(marks["Science"]), max(marks["English"]), max(marks["IT"]))
}

lowest = {
    "Maths": min(marks["Maths"]),
    "Science": min(marks["Science"]),
    "English": min(marks["English"]),
    "IT": min(marks["IT"]),
    "Overall": min(min(marks["Maths"]), min(marks["Science"]), min(marks["English"]), min(marks["IT"]))
}

average = {
    "Maths": sum(marks["Maths"]) / n,
    "Science": sum(marks["Science"]) / n,
    "English": sum(marks["English"]) / n,
    "IT": sum(marks["IT"]) / n,
    "Overall": (sum(marks["Maths"]) + sum(marks["Science"]) + sum(marks["English"]) + sum(marks["IT"])) / (n * 4)
}

print("Highest Marks:")
for key, value in highest.items():
    print(f"{key}: {value}")

print("\nLowest Marks:")
for key, value in lowest.items():
    print(f"{key}: {value}")

print("\nAverage Marks:")
for key, value in average.items():
    print(f"{key}: {value}")

