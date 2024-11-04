# class takes cropped image of one maze and returns the x,y and arm position of the fly and the time
import numpy as np
import cv2
import time
import math

# fly blob parameters
min_fly_area = 20
max_fly_area = 300

box_width = 200
box_height = math.ceil(box_width * 23 / 26)
LR_tolerance = 25
M_tolerance = 5  # 10

# blob above (<) means fly is in the middle arm, and similar for L/R: change the parameters according to the width and height set in getBoxes.py
y_lim = int(15 * box_height / 23) - M_tolerance  # limit to 15/23 of total height
x_L_lim = int(box_width / 2 - LR_tolerance)
x_R_lim = int(box_width / 2 + LR_tolerance)


def init(temp_img, i):
    global img
    img = temp_img
    global index
    index = i


def show():
    cv2.imshow("maze" + str(index), img)
    # print('maze'+str(index+1))


def get_pos():
    # cv2.rectangle(img,(50,50),(60,60),(255,0,0),2)
    contours, hierarchy = cv2.findContours(img, cv2.RETR_CCOMP, cv2.CHAIN_APPROX_SIMPLE)
    cX = -1
    cY = -1
    arm = "X"
    _time = time.time_ns()
    for i, cnt in enumerate(contours):
        # cv2.drawContours(img, contours,i, (255, 0, 0), 1)
        M = cv2.moments(cnt)  # moments of the contour (fly)
        # Needs more filters
        area = cv2.contourArea(cnt)
        if M["m00"] != 0 and area > min_fly_area and area < max_fly_area:
            cX = int(M["m10"] / M["m00"])  # centroid X of fly
            cY = int(M["m01"] / M["m00"])  # centroid Y of fly
            # cv2.circle(img, (cX, cY), 5, (64,64,64), 2)
            if cY < y_lim and cY != -1:
                arm = "M"
            else:
                if cX < x_L_lim and cX != -1:
                    arm = "L"
                elif cX > x_R_lim and cX != -1:
                    arm = "R"
                else:
                    arm = "X"
            break

    cv2.putText(img, arm, (cX, cY), cv2.FONT_HERSHEY_PLAIN, 2, (255, 255, 255), 5)
    return (cX, cY, arm, _time)
