import numpy as np
import matplotlib.pyplot as plt
import cv2


def uniform_noise(image, a=-50, b=50):
    noise = np.random.uniform(a, b, image.shape).astype(np.float32)
    noisy_image = cv2.add(image.astype(np.float32), noise)
    return (np.clip(noisy_image, 0, 255).astype(np.uint8), noise)


def gaussian_noise(image, mean=0, sigma=25):
    noise = np.random.normal(mean, sigma, image.shape).astype(np.float32)
    noisy_image = cv2.add(image.astype(np.float32), noise)
    return (np.clip(noisy_image, 0, 255).astype(np.uint8), noise)


def erlang_noise(image, shape=2, scale=25):
    noise = np.random.gamma(shape, scale, image.shape).astype(np.float32)
    noisy_image = cv2.add(image.astype(np.float32), noise)
    return (np.clip(noisy_image, 0, 255).astype(np.uint8), noise)


def exponential_noise(image, scale=25):
    noise = np.random.exponential(scale, image.shape).astype(np.float32)
    noisy_image = cv2.add(image.astype(np.float32), noise)
    return (np.clip(noisy_image, 0, 255).astype(np.uint8), noise)


def rayleigh_noise(image, scale=25):
    noise = np.random.rayleigh(scale, image.shape).astype(np.float32)
    noisy_image = cv2.add(image.astype(np.float32), noise)
    return (np.clip(noisy_image, 0, 255).astype(np.uint8), noise)


img = cv2.imread("./img1.jpg")

plt.figure(figsize=(20, 10))
plt.subplot(5, 4, 1)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title("Original Image")
plt.axis("off")

noisy_img = uniform_noise(img)
plt.subplot(5, 4, 2)
plt.imshow(cv2.cvtColor(noisy_img[0], cv2.COLOR_BGR2RGB))
plt.title("Uniform Noise Inbuilt")
plt.axis("off")

gauss_noisy_img = gaussian_noise(img)
plt.subplot(5, 4, 3)
plt.imshow(cv2.cvtColor(gauss_noisy_img[0], cv2.COLOR_BGR2RGB))
plt.title("Gaussian Noise Inbuilt")
plt.axis("off")

erlang_noisy_img = erlang_noise(img)
plt.subplot(5, 4, 4)
plt.imshow(cv2.cvtColor(erlang_noisy_img[0], cv2.COLOR_BGR2RGB))
plt.title("Erlang Noise Inbuilt")
plt.axis("off")

exp_noisy_img = exponential_noise(img)
plt.subplot(5, 4, 5)
plt.imshow(cv2.cvtColor(exp_noisy_img[0], cv2.COLOR_BGR2RGB))
plt.title("Exponential Noise Inbuilt")
plt.axis("off")

rayleigh_noisy_img = rayleigh_noise(img)
plt.subplot(5, 4, 6)
plt.imshow(cv2.cvtColor(rayleigh_noisy_img[0], cv2.COLOR_BGR2RGB))
plt.title("Rayleigh Noise Inbuilt")
plt.axis("off")

plt.subplot(5, 4, 7)
plt.hist(noisy_img[1].ravel(), bins=256, color="blue", alpha=0.7)
plt.title("Uniform Noise Histogram")

plt.subplot(5, 4, 8)
plt.hist(gauss_noisy_img[1].ravel(), bins=256, color="green", alpha=0.7)
plt.title("Gaussian Noise Histogram")

plt.subplot(5, 4, 9)
plt.hist(erlang_noisy_img[1].ravel(), bins=256, color="red", alpha=0.7)
plt.title("Erlang Noise Histogram")

plt.subplot(5, 4, 10)
plt.hist(exp_noisy_img[1].ravel(), bins=256, color="purple", alpha=0.7)
plt.title("Exponential Noise Histogram")

plt.subplot(5, 4, 11)
plt.hist(rayleigh_noisy_img[1].ravel(), bins=256, color="orange", alpha=0.7)
plt.title("Rayleigh Noise Histogram")

plt.tight_layout()

plt.show()
