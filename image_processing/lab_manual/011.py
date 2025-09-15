# Question 10: WAP to enhance the input image using histogram equalization
import cv2
import matplotlib.pyplot as plt

img = cv2.imread("./gray_original.png", cv2.IMREAD_GRAYSCALE)

equalized_img = cv2.equalizeHist(img)

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(img, cmap="gray")
plt.axis("off")

plt.subplot(1, 2, 2)
plt.title("After Histogram Equalization")
plt.imshow(equalized_img, cmap="gray")
plt.axis("off")
