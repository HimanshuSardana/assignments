import cv2
import matplotlib.pyplot as plt

img = cv2.imread("./gray.jpeg", cv2.IMREAD_GRAYSCALE)
border_width = 200

img_with_border = cv2.copyMakeBorder(
    img,
    border_width,
    border_width,
    border_width,
    border_width,
    cv2.BORDER_CONSTANT,
    value=(255, 0, 0),
)
plt.imshow(img_with_border)
