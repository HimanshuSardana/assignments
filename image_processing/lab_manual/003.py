import numpy as np
import matplotlib.pyplot as plt
import cv2

img = cv2.imread("./rgb_original.jpg")
gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

r_weight = 0.7
g_weight = 0.2
b_weight = 0.1

weighted_gray = (r_weight * img[:, :, 2] + g_weight * img[:, :, 1] + b_weight * img[:, :, 0]).astype(np.uint8)

threshold = int(np.mean(weighted_gray))
_, binary_img = cv2.threshold(weighted_gray, threshold, 255, cv2.THRESH_BINARY)

plt.subplot(1, 3, 1)
plt.title("Original Image")
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.axis('off')

plt.subplot(1, 3, 2)
plt.title("Weighted Gray Image")
plt.imshow(weighted_gray, cmap='gray')
plt.axis('off')

