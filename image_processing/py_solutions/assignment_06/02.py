import numpy as np
import cv2
import matplotlib.pyplot as plt

src = cv2.imread("img1.jpg")
ref = cv2.imread("img2.jpg")

ref = cv2.resize(ref, (src.shape[1], src.shape[0]))


def display_histogram(image, title):
    color = ("b", "g", "r")
    plt.figure()
    plt.title(title)
    plt.xlabel("Pixel Value")
    plt.ylabel("Frequency")
    values = []
    for i, col in enumerate(color):
        hist = cv2.calcHist([image], [i], None, [256], [0, 256])
        values = hist.copy()
        plt.plot(hist, color=col)
        plt.xlim([0, 256])
    plt.show()
    return values


img1_vals = display_histogram(src, "Source Image Histogram").flatten()
img2_vals = display_histogram(ref, "Reference Image Histogram").flatten()

matched_vals = img1_vals.copy()
color = ("b", "g", "r")
for i in range(256):
    diff = np.abs(img1_vals[i] - img2_vals)
    matched_vals[i] = np.argmin(diff)
matched_vals = matched_vals.astype(np.uint8)
print(matched_vals)

plt.plot(matched_vals)
