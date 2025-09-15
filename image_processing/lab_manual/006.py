import numpy as np
import matplotlib.pyplot as plt
import cv2

img = cv2.imread("./rgb_original.jpg")

# c = 255 / np.log(1 + float(np.max(new_img)))
c = 1
log_img = np.uint8(c * np.log1p(img))

plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(img)

plt.subplot(1, 2, 2)
plt.title("Enhanced Image")
plt.imshow(log_img)

plt.show()

