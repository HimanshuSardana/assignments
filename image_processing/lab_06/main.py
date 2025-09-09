import numpy as np
import cv2
import matplotlib.pyplot as plt

src = cv2.imread("img1.jpg")

dst1 = cv2.blur(src, (5, 5))

dst2 = cv2.boxFilter(src, -1, (5, 5), normalize=True)

dst3 = cv2.GaussianBlur(src, (5, 5), 0)

plt.figure(figsize=(10, 7))
plt.subplot(1, 3, 1)
plt.title("average filter")
plt.imshow(cv2.cvtColor(dst1, cv2.COLOR_BGR2RGB))
plt.axis("off")
plt.subplot(1, 3, 2)
plt.title("weighted average filter")
plt.imshow(cv2.cvtColor(dst2, cv2.COLOR_BGR2RGB))
plt.axis("off")
plt.subplot(1, 3, 3)
plt.title("gaussian filter")
plt.imshow(cv2.cvtColor(dst3, cv2.COLOR_BGR2RGB))
plt.axis("off")
