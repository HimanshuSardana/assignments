import matplotlib.pyplot as plt
import cv2

img1 = cv2.imread("./img1.jpg")
img2 = cv2.imread("./img2.jpg")

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = cv2.multiply(img1, img2, scale=1.0 / 255.0)

cv2.imwrite("blended_image.jpg", img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
