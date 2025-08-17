import numpy as np
import cv2

def img_to_array(path):
    img = cv2.imread(path)
    with open(f"{path}.txt", "a+") as f:
        f.write(str(img))

img_to_array("./screenshots.png")
