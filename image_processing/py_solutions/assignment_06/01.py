import cv2
import matplotlib.pyplot as plt

img = cv2.imread("img1.jpg")

gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
final_img = cv2.equalizeHist(gray)

plt.subplot(1, 2, 1)
plt.imshow(gray, cmap="gray")
plt.title("Original Image")
plt.axis("off")
plt.subplot(1, 2, 2)
plt.imshow(final_img, cmap="gray")
plt.title("Equalized Image")
plt.axis("off")
