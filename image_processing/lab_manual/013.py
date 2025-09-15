# WAP to smooth the image using Averaging filter (un-weighted), Weighted filter given by h(x, y) - max(|x|, |y|), gaussian filter
import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("./rgb_original.jpg")

# Averaging filter
kernel_size = 5
averaging_kernel = np.ones((kernel_size, kernel_size), np.float32) / (
    kernel_size * kernel_size
)
averaged_img = cv2.filter2D(img, -1, averaging_kernel)

# TODO: Weighted filter given by h(x, y) = max(|x|, |y|)
weighted_kernel = np.array([[1, 2, 1], [2, 4, 2], [1, 2, 1]], np.float32) / 16
weighted_img = cv2.filter2D(img, -1, weighted_kernel)

# Gaussian filter
gaussian_img = cv2.GaussianBlur(img, (5, 5), 0)

plt.subplot(1, 4, 1)
plt.title("Original Image")
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.axis("off")

plt.subplot(1, 4, 2)
plt.title("Averaging Filter")
plt.imshow(cv2.cvtColor(averaged_img, cv2.COLOR_BGR2RGB))
plt.axis("off")

plt.subplot(1, 4, 3)
plt.title("Weighted Filter")
plt.imshow(cv2.cvtColor(weighted_img, cv2.COLOR_BGR2RGB))
plt.axis("off")

plt.subplot(1, 4, 4)
plt.title("Gaussian Filter")
plt.imshow(cv2.cvtColor(gaussian_img, cv2.COLOR_BGR2RGB))
plt.axis("off")
