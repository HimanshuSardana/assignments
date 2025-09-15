# WAP to match the histogram of the input image with that of reference image using histogram matching technique
import cv2
import numpy as np
import matplotlib.pyplot as plt


def histogram_matching(source, reference):
    src_hist, bins = np.histogram(source.flatten(), 256, [0, 256])
    ref_hist, bins = np.histogram(reference.flatten(), 256, [0, 256])

    src_cdf = src_hist.cumsum()
    ref_cdf = ref_hist.cumsum()

    src_cdf_normalized = src_cdf * (255 / src_cdf[-1])
    ref_cdf_normalized = ref_cdf * (255 / ref_cdf[-1])

    lookup_table = np.zeros(256)
    ref_idx = 0
    for src_idx in range(256):
        while (
            ref_idx < 255 and ref_cdf_normalized[ref_idx] < src_cdf_normalized[src_idx]
        ):
            ref_idx += 1
        lookup_table[src_idx] = ref_idx

    matched_img = cv2.LUT(source, lookup_table.astype(np.uint8))

    return matched_img


source_img = cv2.imread("./gray_original.png", cv2.IMREAD_GRAYSCALE)
reference_img = cv2.imread("./rgb_original.jpg", cv2.IMREAD_GRAYSCALE)
matched_img = histogram_matching(source_img, reference_img)

plt.subplot(1, 3, 1)
plt.title("Source Image")
plt.imshow(source_img, cmap="gray")
plt.axis("off")

plt.subplot(1, 3, 2)
plt.title("Reference Image")
plt.imshow(reference_img, cmap="gray")
plt.axis("off")

plt.subplot(1, 3, 3)
plt.title("Matched Image")
plt.imshow(matched_img, cmap="gray")
plt.axis("off")
