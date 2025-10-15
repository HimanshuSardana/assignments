import matplotlib.pyplot as plt

img = plt.imread("./gray_image.jpg")
plt.imshow(img, cmap="gray")
plt.axis("off")
plt.show()
