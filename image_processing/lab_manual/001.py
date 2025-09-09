import numpy as np
import matplotlib.pyplot as plt
import cv2

img = cv2.imread("./gray_original.png", cv2.IMREAD_GRAYSCALE)
threshold = int(np.mean(img))
_, binary_img = cv2.threshold(img, threshold, 255, cv2.THRESH_BINARY)

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(img, cmap='gray')
plt.axis('off')

plt.subplot(1, 2, 2)
plt.title("Binary Image")
plt.imshow(binary_img, cmap='gray')
plt.axis('off')
