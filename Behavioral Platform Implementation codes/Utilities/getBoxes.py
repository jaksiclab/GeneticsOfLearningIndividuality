# for deining the bounding rectangles of each arena manually
# align screen with guidelines
# 1   9   17  25  33  41  49  57
# 2   10  18  26  34  42  50  58
# 3   11  19  27  35  43  51  59
# .   .   .   .   .   .   .   .
# 8   16  24  32  40  48  56  64
# maintain width and height constant
# outputs to boundingRectangles.csv
import numpy as np
import cv2
import math

boxes = [[0, 0, 0, 0]]
x = 10
y = 10
w = 200
h = 200
step = 10
count = 0

ch = "increase"

cap = cv2.VideoCapture(0)
# cap.open(1, apiPreference=cv2.CAP_ANY)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 4096)  # 1920 max for ROG eye; 4096 for imagingSource
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 3000)  # 1080 max for ROG eye; 3000 for imagingSource
cap.set(
    cv2.CAP_PROP_FPS, 30
)  # check documentation for what fps is supported at what resolution (30 fps at max resolution)

while True:
    ret, img_copy = cap.read()
    img_h, img_w, layers = img_copy.shape
    for i in range(0, img_w, 400):
        cv2.line(img_copy, (i, 0), (i, img_h), (127, 127, 127), 3)
        for i in range(0, img_h, 400):
            cv2.line(img_copy, (0, i), (img_w, i), (127, 127, 127), 3)
    img_h = int(img_h / 3)
    img_w = int(img_w / 3)
    temp = cv2.resize(img_copy, (img_w, img_h))
    cv2.imshow("temp", temp)  # preview
    if cv2.waitKey(1) & 0xFF == 27:
        break

for i in range(50):  # take 50 images to stabilize as the camera auto focuses
    ret, img = cap.read()

# for saving the video
# fourcc = cv2.VideoWriter_fourcc(*'MP4V')
# out = cv2.VideoWriter('output.mp4', fourcc, 20, (854,480))
while True:
    img_copy = img.copy()
    cv2.rectangle(img_copy, (x, y), (x + w, y + h), (255, 0, 0), 3)
    img_h, img_w, layers = img_copy.shape
    img_h = int(img_h / 3)
    img_w = int(img_w / 3)
    temp = cv2.resize(img_copy, (img_w, img_h))
    cv2.imshow("temp", temp)  # preview
    temp = cv2.resize(img_copy, (img_w, img_h))
    cv2.imshow("main", temp)
    # out.write(img) #writing to the video file frame by frame
    key = cv2.waitKey(0)
    # waitKey(0) for images and 1 for video
    print(key)
    if key == ord("i"):
        ch = "increase"
    if key == ord("d"):
        ch = "decrease"
    if key == ord("n"):
        boxes.append([x, y, w, h])
        count = count + 1
        x1, y1, w1, h1 = boxes[count]
        cv2.rectangle(img, (x1, y1), (x1 + w1, y1 + h1), (0, 255, 0), 3)
        cv2.rectangle(img_copy, (x1, y1), (x1 + w1, y1 + h1), (0, 255, 0), 3)
    if key == ord("x"):
        if ch == "increase":
            x = x + step
        elif ch == "decrease":
            x = x - step
        print(x)
    if key == ord("y"):
        if ch == "increase":
            y = y + step
        elif ch == "decrease":
            y = y - step
        print(y)
    if key == ord("w"):
        if ch == "increase":
            w = w + step
        elif ch == "decrease":
            w = w - step
        print(w)
    if key == ord("h"):
        if ch == "increase":
            h = h + step
        elif ch == "decrease":
            h = h - step
        print(h)
    if key == ord("s"):
        if ch == "increase":
            step = step + 5
        elif ch == "decrease":
            step = step - 5
        print(step)
    if key == ord("q"):
        if w < h:
            h = w
        elif h < w:
            w = h
        print(w)
    if key == ord("t"):
        for i in range(50):  # take 50 images to stabilize as the camera auto focuses
            ret, img = cap.read()
    if key == 27:  # ord('q'): #press esc to exit (27)
        break
# When everything is done, release the capture
boxes.pop(0)
np.savetxt("boundingRectangles.csv", boxes, fmt="%i", delimiter=",")
cap.release()
cv2.destroyAllWindows()
