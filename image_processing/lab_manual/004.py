import numpy as np
import matplotlib.pyplot as plt
import cv2

# WAP to draw a border around the input image, input the width (in terms of pixel count) and the desired color of the border from the user.
img = cv2.imread("./gray_original.png", cv2.IMREAD_GRAYSCALE)
border_width = int(input("Enter border width (in pixels): "))
border_color = int(input("Enter border color (0-255): "))

bordered_img = cv2.copyMakeBorder(img, border_width, border_width, border_width, border_width, cv2.BORDER_CONSTANT, value=border_color)

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(img, cmap='gray')
plt.axis('off')

plt.subplot(1, 2, 2)
plt.title("Image with Border")
plt.imshow(bordered_img, cmap='gray')
plt.axis('off')

plt.show()

threshold = int(np.mean(img))
_, binary_img = cv2.threshold(img, threshold, 255, cv2.THRESH_BINARY)
binary_img = cv2.copyMakeBorder(binary_img, border_width, border_width, border_width, border_width, cv2.BORDER_CONSTANT, value=border_color)

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(img, cmap='gray')
plt.axis('off')

plt.subplot(1, 2, 2)
plt.title("Binary Image")
plt.imshow(binary_img, cmap='gray')
plt.axis('off')

plt.show()
