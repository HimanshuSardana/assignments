import cv2

img = cv2.imread("gray_original.png")

gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
plt.imshow(gray_img)
cv2.imwrite("gray_greyscale.png", gray_img)
