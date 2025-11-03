import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("./color.jpg")

grayscale = np.mean(img, axis=2)
# convert grayscale to unsigned integers (get rid of decimals/floating point numbers)
grayscale.astype(np.uint8)
plt.imshow(grayscale)

weightage_r = 0.6
weightage_g = 0.0
weightage_b = 0.4

img = cv2.imread("./holi.jpg")
gray_img = (
    (weightage_r * img[:, :, 2])
    + (weightage_g * img[:, :, 1])
    + (weightage_b * img[:, :, 0])
)

plt.imshow(gray_img)
