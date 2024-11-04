# for deining the bounding rectangles of each arena manually
# align screen with guidelines
# 1   9   17  25  33  41  49  57
# 2   10  18  26  34  42  50  58
# 3   11  19  27  35  43  51  59
# .   .   .   .   .   .   .   .
# 8   16  24  32  40  48  56  64
# maintain width and height constant
# outputs to boundingRectangles.csv

# mm
# height = 23
# width = 26
# upper arm = 15 (if y < 15, fly is in upper arm: clearances can be added later) (y < 15/23)
# the above information needs to be updated in unit_fly.py of each conditioning assay

import numpy as np
import cv2
import math
from operator import itemgetter
from glob import glob
from matplotlib import pyplot as plt
import time

ARUCO_DICT = {
    "DICT_4X4_50": cv2.aruco.DICT_4X4_50,
    "DICT_4X4_100": cv2.aruco.DICT_4X4_100,
    "DICT_4X4_250": cv2.aruco.DICT_4X4_250,
    "DICT_4X4_1000": cv2.aruco.DICT_4X4_1000,
    "DICT_5X5_50": cv2.aruco.DICT_5X5_50,
    "DICT_5X5_100": cv2.aruco.DICT_5X5_100,
    "DICT_5X5_250": cv2.aruco.DICT_5X5_250,
    "DICT_5X5_1000": cv2.aruco.DICT_5X5_1000,
    "DICT_6X6_50": cv2.aruco.DICT_6X6_50,
    "DICT_6X6_100": cv2.aruco.DICT_6X6_100,
    "DICT_6X6_250": cv2.aruco.DICT_6X6_250,
    "DICT_6X6_1000": cv2.aruco.DICT_6X6_1000,
    "DICT_7X7_50": cv2.aruco.DICT_7X7_50,
    "DICT_7X7_100": cv2.aruco.DICT_7X7_100,
    "DICT_7X7_250": cv2.aruco.DICT_7X7_250,
    "DICT_7X7_1000": cv2.aruco.DICT_7X7_1000,
    "DICT_ARUCO_ORIGINAL": cv2.aruco.DICT_ARUCO_ORIGINAL,
    "DICT_APRILTAG_16h5": cv2.aruco.DICT_APRILTAG_16h5,
    "DICT_APRILTAG_25h9": cv2.aruco.DICT_APRILTAG_25h9,
    "DICT_APRILTAG_36h10": cv2.aruco.DICT_APRILTAG_36h10,
    "DICT_APRILTAG_36h11": cv2.aruco.DICT_APRILTAG_36h11,
}


def markerID_to_mazeNum(x):
    l = 16 * math.floor((x - 1) / 8) + (x - 1) % 8 + 1
    return (l, l + 8)


arucoDictStr = "DICT_4X4_50"

boxes = [[0, 0, 0, 0]] * 64
x = 10
y = 10
w = 190
h = math.ceil(w * 23 / 26)
step = 10
count = 0

cap = cv2.VideoCapture(0)
# cap.open(1, apiPreference=cv2.CAP_ANY)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 4096)  # 1920 max for ROG eye; 4096 for imagingSource
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 3000)  # 1080 max for ROG eye; 3000 for imagingSource
cap.set(
    cv2.CAP_PROP_FPS, 30
)  # check documentation for what fps is supported at what resolution (30 fps at max resolution)

while True:
    ret, image = cap.read()
    img_h, img_w, layers = image.shape
    # detect aruco markers
    arucoDict = cv2.aruco.Dictionary_get(ARUCO_DICT[arucoDictStr])
    arucoParams = cv2.aruco.DetectorParameters_create()
    (corners, ids, rejected) = cv2.aruco.detectMarkers(
        image, arucoDict, parameters=arucoParams
    )

    target_corners_found = 0
    # verify *at least* one ArUco marker was detected
    if len(corners) > 0:
        # flatten the ArUco IDs list
        ids = ids.flatten()
        # loop over the detected ArUCo corners
        target_corners_found = 0
        for markerCorner, markerID in zip(corners, ids):
            # extract the marker corners (which are always returned in
            # top-left, top-right, bottom-right, and bottom-left order)
            corners = markerCorner.reshape((4, 2))
            (topLeft, topRight, bottomRight, bottomLeft) = corners
            # convert each of the (x, y)-coordinate pairs to integers
            topRight = [int(topRight[0]), int(topRight[1])]
            bottomRight = [int(bottomRight[0]), int(bottomRight[1])]
            bottomLeft = [int(bottomLeft[0]), int(bottomLeft[1])]
            topLeft = [int(topLeft[0]), int(topLeft[1])]
            # draw the bounding box of the ArUCo detection
            cv2.line(image, topLeft, topRight, (0, 255, 0), 2)
            cv2.line(image, topRight, bottomRight, (0, 255, 0), 2)
            cv2.line(image, bottomRight, bottomLeft, (0, 255, 0), 2)
            cv2.line(image, bottomLeft, topLeft, (0, 255, 0), 2)
            # compute and draw the center (x, y)-coordinates of the ArUco
            # marker
            cX = int((topLeft[0] + bottomRight[0]) / 2.0)
            cY = int((topLeft[1] + bottomRight[1]) / 2.0)
            cv2.circle(image, (cX, cY), 4, (0, 0, 255), -1)
            # draw the ArUco marker ID on the image
            cv2.putText(
                image,
                str(markerID),
                (topLeft[0], topLeft[1]),
                cv2.FONT_HERSHEY_SIMPLEX,
                0.5,
                (0, 255, 0),
                2,
            )

            maze_l, maze_r = markerID_to_mazeNum(markerID)
            boxes[maze_l - 1] = [cX - 200, cY - 50, w, h]
            boxes[maze_r - 1] = [cX + 50, cY - 50, w, h]
            image = cv2.rectangle(
                image,
                (boxes[maze_l - 1][0], boxes[maze_l - 1][1]),
                (boxes[maze_l - 1][0] + w, boxes[maze_l - 1][1] + h),
                (255, 0, 0),
                2,
            )
            cv2.putText(
                image,
                str(maze_l),
                (boxes[maze_l - 1][0], boxes[maze_l - 1][1]),
                cv2.FONT_HERSHEY_SIMPLEX,
                0.5,
                (0, 255, 0),
                2,
            )
            image = cv2.rectangle(
                image,
                (boxes[maze_r - 1][0], boxes[maze_r - 1][1]),
                (boxes[maze_r - 1][0] + w, boxes[maze_r - 1][1] + h),
                (255, 0, 0),
                2,
            )
            cv2.putText(
                image,
                str(maze_r),
                (boxes[maze_r - 1][0], boxes[maze_r - 1][1]),
                cv2.FONT_HERSHEY_SIMPLEX,
                0.5,
                (0, 255, 0),
                2,
            )
    if len(corners) == 32:
        cv2.imwrite("image.png", image)
        break
    img_h = int(img_h / 3)
    img_w = int(img_w / 3)
    image = cv2.resize(image, (img_w, img_h))
    cv2.imshow("image", image)
    key = cv2.waitKey(1)
    if key == 27:  # ord('q'): #press esc to exit (27)
        break

# np.savetxt("boundingRectangles_aruco.csv", boxes, fmt="%i", delimiter=",")
cap.release()
cv2.destroyAllWindows()
