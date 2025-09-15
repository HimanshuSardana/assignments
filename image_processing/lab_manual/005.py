import numpy as np
import matplotlib.pyplot as plt
import cv2

img = cv2.imread("./gray_original.png")
complement = 255 - img

binary_img = cv2.threshold(img, 128, 255, cv2.THRESH_BINARY)[1]
complement_binary = cv2.threshold(complement, 128, 255, cv2.THRESH_BINARY)[1]

plt.subplot(2, 2, 1)
plt.title("Original Gray Image")
plt.imshow(img, cmap='gray')
plt.axis('off')

plt.subplot(2, 2, 2)
plt.title("Complement Image")
plt.imshow(complement, cmap='gray')
plt.axis('off')

plt.subplot(2, 2, 3)
plt.title("Binary Image")
plt.imshow(binary_img, cmap='gray')
plt.axis('off')

plt.subplot(2, 2, 4)
plt.title("Complement Binary Image")
plt.imshow(complement_binary, cmap='gray')
plt.axis('off')
