# Get complement of image
import cv2
import numpy as np

img = cv2.imread('./binary_image.jpeg')

complement = 255 - img
cv2.imwrite('complement.jpeg', complement)
