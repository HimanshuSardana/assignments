import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("rgb_original.jpg").astype(np.float32)

r1, r2 = 80, 120
s1, s2 = 0, 100

mask = (img >= r1) & (img <= r2)

img[mask] = ((img[mask] - 1) / (r2 - r1)) * (s2 - s1) + s1
img = np.clip(img, 0, 255).astype(np.float32)

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(cv2.imread("rgb_original.jpg"))
plt.axis("off")

plt.subplot(1, 2, 2)
plt.title("After Contrast Stretching")
plt.imshow(img)
plt.axis("off")
