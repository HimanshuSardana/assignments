import numpy as np

matrix_2x2 = np.random.randint(0, 100, size=(2, 2))
matrix_3x3 = np.random.randint(0, 100, size=(3, 3))

metrics = ["Accuracy", "Precision", "Recall", "F1-Score", "MCC"]

print(matrix_2x2)
print("For 2x2 Matrix")
TP = matrix_2x2[0][0]
TN = matrix_2x2[1][1]
FP = matrix_2x2[1][0]
FN = matrix_2x2[0][1]

accuracy = (TP + FP) / (TP + TN + FP + FN)
print("Accuracy", accuracy)

precision = TP / (TP + FP)
print("Precision", precision)

recall = TP / (TP + FN)
print("Recall", recall)

f1_score = (2 * precision * recall) / (precision + recall)
print("F1-Score", f1_score)

mcc = ((TP * TN) - (FP * FN)) / np.sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN))
print("MCC", mcc)


print(matrix_3x3)
print("For 3x3 matrix")

tp = matrix_3x3[0][0]
fn = matrix_3x3[0][1] + matrix_3x3[0][2]
fp = matrix_3x3[1][0] + matrix_3x3[2][0]
tn = matrix_3x3[1][1] + matrix_3x3[1][2] + matrix_3x3[2][1] + matrix_3x3[2][2]

accuracy = (tp + fp) / (tp + tn + fp + fn)
print("Accuracy", accuracy)

precision = tp / (tp + fp)
print("Precision", precision)

recall = tp / (tp + fn)
print("Recall", recall)

f1_score = (2 * precision * recall) / (precision + recall)
print("F1-Score", f1_score)

mcc = ((tp * tn) - (fp * fn)) / np.sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn))
print("MCC", mcc)
