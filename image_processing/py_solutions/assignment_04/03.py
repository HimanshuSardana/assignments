import numpy as np
import matplotlib.pyplot as plt

new_img = (np.random.rand(3, 3) * 255).astype(np.uint8)


fig, axes = plt.subplots(1, 11, figsize=(2.2 * (11), 4))

axes[0].imshow(new_img)
axes[0].set_title("Original")
axes[0].axis("off")

for i in range(10):
    c = 255 / np.log(1 + float(np.max(new_img)))
    log_img = np.uint8(c * np.log1p(new_img))

    axes[i + 1].imshow(log_img)
    axes[i + 1].set_title(f"Transformation {i + 1}")
    axes[i + 1].axis("off")

    new_img = log_img

plt.tight_layout()
plt.show()
