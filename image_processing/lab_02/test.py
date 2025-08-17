import cv2

img = cv2.imread("./binary_image.jpeg", cv2.IMREAD_GRAYSCALE)
print(img.flatten())

values = set(img.flatten())
print(values)
