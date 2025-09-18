import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("./rgb_original.jpg")
gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Laplacian filter
laplacian_img = cv2.Laplacian(gray_img, cv2.CV_64F)
lapalcian_img = cv2.convertScaleAbs(laplacian_img)

# Sobel operator
sobel_x = cv2.Sobel(gray_img, cv2.CV_64F, 1, 0, ksize=5)
sobel_y = cv2.Sobel(gray_img, cv2.CV_64F, 0, 1, ksize=5)
sobel_img = cv2.magnitude(sobel_x, sobel_y)

# Roberts Kernel
ky = np.array([[1, 0], [0, -1]], dtype=np.float32)
kx = np.array([[0, 1], [-1, 0]], dtype=np.float32)

roberts_x = cv2.filter2D(gray_img, cv2.CV_64F, kx)
roberts_y = cv2.filter2D(gray_img, cv2.CV_64F, ky)

roberts_img = cv2.magnitude(roberts_x, roberts_y)

# Canny edge detection
canny_img = cv2.Canny(gray_img, 100, 200)

# Unsharp masking
blurred_img = cv2.GaussianBlur(gray_img, (5, 5), 3)
unsharp_img = cv2.addWeighted(gray_img, 1.5, blurred_img, -0.5, 0)
unsharp_img = np.clip(unsharp_img, 0, 255).astype(np.uint8)

plt.subplot(2, 3, 1)
plt.title("Original Image")
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.axis("off")

plt.subplot(2, 3, 2)
plt.title("Laplacian Filter")
plt.imshow(laplacian_img, cmap="gray")
plt.axis("off")

plt.subplot(2, 3, 3)
plt.title("Sobel Operator")
plt.imshow(sobel_img, cmap="gray")
plt.axis("off")

plt.subplot(2, 3, 4)
plt.title("Canny Edge Detection")
plt.imshow(canny_img, cmap="gray")
plt.axis("off")

plt.subplot(2, 3, 5)
plt.title("Unsharp Masking")
plt.imshow(unsharp_img, cmap="gray")
plt.axis("off")

plt.subplot(2, 3, 6)
plt.title("Roberts Operator")
plt.imshow(roberts_img, cmap="gray")
plt.axis("off")
