import cv2
import matplotlib.pyplot as plt

img = cv2.imread("test.jpg")

B, G, R = cv2.split(img)
plt.imshow(B)
plt.imshow(G)
plt.imshow(R)
