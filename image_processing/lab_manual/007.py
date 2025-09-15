import numpy as np
import matplotlib.pyplot as plt
import cv2

img = cv2.imread("./rgb_original.jpg")

gamma = float(input("Enter value of gamma: "))
c = 1.0

norm_img = img / 255

power_log_img = c * np.power(norm_img, gamma)

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(img)
plt.axis("off")

plt.subplot(1, 2, 2)
plt.title("After Law Transform")
plt.imshow(power_log_img)
plt.axis("off")
