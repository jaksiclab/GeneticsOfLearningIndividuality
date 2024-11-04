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
# width_pixel(w) = 190
# upper arm = 15 (if y < 15, fly is in upper arm: clearances can be added later) (y < 15/23)
# the above information needs to be updated in unit_fly.py of each conditioning assay

import numpy as np
import cv2
import math
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


def markerID_to_mazeNum2(x):
    id1 = 16 * math.floor((x - 1) / 8) + (x - 1) % 8 + 1
    id2 = id1 + 8
    return (id1, id2)


arucoDictStr = "DICT_4X4_100"

boxes = [[-999, -999, -999, -999]] * 64
x = 10
y = 10
w = 200
h = math.ceil(w * 23 / 26)
step = 10
count = 0

x_min = 600
x_max = 3700
y_min = 750
y_max = 2750

ch = "increase"


def boxes_filled():
    for i in range(len(boxes)):
        for j in range(3):
            if boxes[i][j] == -999:
                print("F")
                return False
    print("T")
    return True


cap = cv2.VideoCapture(0)
# cap.open(1, apiPreference=cv2.CAP_ANY)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 4096)  # 1920 max for ROG eye; 4096 for imagingSource
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 3000)  # 1080 max for ROG eye; 3000 for imagingSource
cap.set(
    cv2.CAP_PROP_FPS, 30
)  # check documentation for what fps is supported at what resolution (30 fps at max resolution)

# for aligning LCd with camera, grids are provided for visual assiatance
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
    cv2.putText(
        temp,
        "Align the LCD with the grid then press Esc to continue",
        (50, 50),
        cv2.FONT_HERSHEY_SIMPLEX,
        0.5,
        (0, 255, 0),
        2,
    )
    cv2.imshow("temp", temp)  # preview
    if cv2.waitKey(1) & 0xFF == 27:
        break
cv2.destroyAllWindows()

for i in range(50):  # take 50 images to stabilize as the camera auto focuses
    ret, img = cap.read()

while not boxes_filled():
    # image to analyse
    ret, image = cap.read()
    img_h, img_w, layers = image.shape

    # detect aruco markers
    # previous version of cv2
    # arucoDict = cv2.aruco.Dictionary_get(ARUCO_DICT[arucoDictStr])
    # arucoParams = cv2.aruco.DetectorParameters_create()
    # (corners, ids, rejected) = cv2.aruco.detectMarkers(
    #     image, arucoDict, parameters=arucoParams
    # )
    # latest cv2 version opencv-contrib-python
    arucoDict = cv2.aruco.getPredefinedDictionary(ARUCO_DICT[arucoDictStr])
    parameters = cv2.aruco.DetectorParameters()
    aruco_detector = cv2.aruco.ArucoDetector(arucoDict, parameters)
    (corners, ids, rejected) = aruco_detector.detectMarkers(image)

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
            cv2.line(image, topLeft, topRight, (0, 0, 255), 2)
            cv2.line(image, topRight, bottomRight, (0, 0, 255), 2)
            cv2.line(image, bottomRight, bottomLeft, (0, 0, 255), 2)
            cv2.line(image, bottomLeft, topLeft, (0, 0, 255), 2)
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

            maze_nums = markerID_to_mazeNum2(markerID)

            for maze_num in maze_nums:
                if boxes[maze_num - 1] == [-999, -999, -999, -999] and (
                    cX > x_min and cX < x_max and cY > y_min and cY < y_max
                ):
                    if (maze_num - 1) % 16 / 16 < 0.5 and maze_num < 65:
                        boxes[maze_num - 1] = [cX - 160, cY - 70, w, h]
                        image = cv2.rectangle(
                            image,
                            (boxes[maze_num - 1][0], boxes[maze_num - 1][1]),
                            (boxes[maze_num - 1][0] + w, boxes[maze_num - 1][1] + h),
                            (127, 0, 0),
                            3,
                        )
                        cv2.putText(
                            image,
                            str(maze_num),
                            (boxes[maze_num - 1][0], boxes[maze_num - 1][1]),
                            cv2.FONT_HERSHEY_SIMPLEX,
                            0.5,
                            (0, 255, 0),
                            3,
                        )
                    elif (maze_num - 1) % 16 / 16 >= 0.5 and maze_num < 65:
                        boxes[maze_num - 1] = [cX - 0, cY - 70, w, h]
                        image = cv2.rectangle(
                            image,
                            (boxes[maze_num - 1][0], boxes[maze_num - 1][1]),
                            (boxes[maze_num - 1][0] + w, boxes[maze_num - 1][1] + h),
                            (127, 0, 0),
                            3,
                        )
                        cv2.putText(
                            image,
                            str(maze_num),
                            (boxes[maze_num - 1][0], boxes[maze_num - 1][1]),
                            cv2.FONT_HERSHEY_SIMPLEX,
                            0.5,
                            (0, 255, 0),
                            3,
                        )

        img_h = int(img_h / 3)
        img_w = int(img_w / 3)
        temp = cv2.resize(image, (img_w, img_h))
        cv2.putText(
            temp,
            "Press Esc and re-run program if it is taking to long. ",
            (50, 50),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.5,
            (0, 0, 255),
            2,
        )
        cv2.imshow("window", temp)
        if cv2.waitKey(1) & 0xFF == 27:
            break

while True:
    ret, image = cap.read()
    img_h, img_w, layers = image.shape
    for i in range(len(boxes)):
        image = cv2.rectangle(
            image,
            (boxes[i][0], boxes[i][1]),
            (boxes[i][0] + w, boxes[i][1] + h),
            (127, 0, 0),
            3,
        )
        cv2.putText(
            image,
            str(i + 1),
            (boxes[i][0], boxes[i][1]),
            cv2.FONT_HERSHEY_SIMPLEX,
            2,
            (0, 255, 0),
            2,
        )

    # cv2.imshow("window",image)
    img_h = int(img_h / 3)
    img_w = int(img_w / 3)
    temp = cv2.resize(image, (img_w, img_h))
    cv2.putText(
        temp,
        "Bounding boxes of mazes acquired. Press Esc and run the assay. ",
        (50, 50),
        cv2.FONT_HERSHEY_SIMPLEX,
        0.5,
        (0, 255, 0),
        2,
    )
    cv2.imshow("window", temp)
    key = cv2.waitKey(1)
    if key == 27:  # ord('q'): #press esc to exit (27)
        break

np.savetxt("boundingRectangles.csv", boxes, fmt="%i", delimiter=",")
cap.release()
cv2.destroyAllWindows()
