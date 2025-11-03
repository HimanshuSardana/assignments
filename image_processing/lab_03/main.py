import matplotlib.pyplot as plt
import cv2

img1 = cv2.imread("img2.jpg")
img2 = cv2.imread("img2.jpg")

if img1 is None or img2 is None:
    raise FileNotFoundError("One or both image files could not be loaded.")

img2 = cv2.resize(img2, (img1.shape[1], img1.shape[0]))

img = cv2.bitwise_or(img1, img2)

_ = cv2.imwrite("blended_image.jpg", img)
# cv2.imshow('Blended Image', img)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.show()
