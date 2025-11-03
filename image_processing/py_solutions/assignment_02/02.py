import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("./gray.jpeg", cv2.IMREAD_GRAYSCALE)

# Using mean threshold
_, binary_img = cv2.threshold(img, np.mean(img), 255, cv2.THRESH_BINARY)
plt.imshow(binary_img)

# Usin user-defined threshold
threshold = 80
_, binary_img = cv2.threshold(img, threshold, 255, cv2.THRESH_BINARY)
plt.imshow(binary_img)
