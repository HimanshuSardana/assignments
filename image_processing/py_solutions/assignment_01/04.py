import cv2

img = cv2.imread(r"test.jpg")
B, G, R = img[100][100]
print(f"Red: {R}\nGreen: {G}\nBlue: {B}")
