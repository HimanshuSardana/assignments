import cv2
import matplotlib.pyplot as plt

img = cv2.imread("./gray.jpeg")
# print(img)

complement = 255 - img
plt.imshow(complement)
