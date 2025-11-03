import cv2

img = cv2.imread(r"test.jpg")

print(f"Height: {img.shape[0]}  Width: {img.shape[1]}")
