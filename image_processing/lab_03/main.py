import matplotlib.pyplot as plt
import cv2
import numpy as np

img1 = cv2.imread('./img1.jpg')
img2 = cv2.imread('./img2.jpg')

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = np.bitwise_or(np.array(img1, dtype=np.uint8), np.array(img2, dtype=np.uint8))

cv2.imwrite('blended_image.jpg', img)
# cv2.imshow('Blended Image', img)
plt.imshow(img)
