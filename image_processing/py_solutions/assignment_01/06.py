import cv2
import matplotlib.pyplot as plt

img = cv2.imread("test.jpg")

hsv_img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
plt.imshow(hsv_img)
