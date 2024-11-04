# for controlling the LCD patterns
import numpy as np
import cv2
import math

col = {}
col["B"] = (255, 0, 0)
col["G"] = (0, 255, 0)
col["R"] = (0, 0, 255)
col["X"] = (0, 0, 0)
# define all 27 + 1 patterns possible
pat = [
    "BBB",
    "BBG",
    "BBR",
    "BGB",
    "BGG",
    "BGR",
    "BRB",
    "BRG",
    "BRR",
    "GBB",
    "GBG",
    "GBR",
    "GGB",
    "GGG",
    "GGR",
    "GRB",
    "GRG",
    "GRR",
    "RBB",
    "RBG",
    "RBR",
    "RGB",
    "RGG",
    "RGR",
    "RRB",
    "RRG",
    "RRR",
    "XXX",
]
# define the starting patters for 64 mazes as index of pat stating from 0, set to black
# patterns = [27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27]
p = 27
patterns = [p] * 64
# pixel per mm
ppmmW = 1920 / 533.34  # LG 25BL56WY
ppmmH = 1200 / 338.76  # LG 25BL56WY
# dimension of single maze
widthMM = 30
heightMM = 30
V_dist_btwn_mazesMM = 40  # 7.5+9+22.5
H_dist_btwn_mazesMM = 60  # 20+9+9+20
# offset from LCD border
offsXMM = 25.5
offsYMM = 29.5
vertical_arm_fraction = 8 / 15

n_rows = 8
n_cols = 8

width = math.ceil(ppmmW * widthMM)
height = math.ceil(ppmmH * heightMM)
H_dist_btwn_mazes = math.ceil(ppmmW * H_dist_btwn_mazesMM)
V_dist_btwn_mazes = math.ceil(ppmmH * V_dist_btwn_mazesMM)
offsX = math.ceil(ppmmW * offsXMM)
offsY = math.ceil(ppmmH * offsYMM)


imgArena = np.zeros((1200, 1920, 3), np.uint8)


def updateLCD(patterns_subset):
    c = 0
    patterns[0 : len(patterns_subset)] = patterns_subset
    for i in range(n_cols):
        for j in range(n_rows):
            clearance_V = offsY + int(j / 4) * V_dist_btwn_mazes
            clearance_H = offsX + int(i / 2) * H_dist_btwn_mazes
            imgArena[
                clearance_V
                + j * height : clearance_V
                + j * height
                + math.ceil(vertical_arm_fraction * height),
                clearance_H + i * width : clearance_H + i * width + width,
            ] = col[pat[patterns[c]][1]]
            imgArena[
                clearance_V
                + j * height
                + math.ceil(vertical_arm_fraction * height) : clearance_V
                + j * height
                + height,
                clearance_H
                + i * width : clearance_H
                + i * width
                + math.ceil(width / 2),
            ] = col[pat[patterns[c]][0]]
            imgArena[
                clearance_V
                + j * height
                + math.ceil(vertical_arm_fraction * height) : clearance_V
                + j * height
                + height,
                clearance_H
                + i * width
                + math.ceil(width / 2) : clearance_H
                + i * width
                + width,
            ] = col[pat[patterns[c]][2]]
            c = c + 1
            cv2.namedWindow("image", cv2.WND_PROP_FULLSCREEN)
            # cv2.moveWindow("image",5000,0)
            cv2.setWindowProperty(
                "image", cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN
            )
            cv2.imshow("image", imgArena)
            # return("updated")
            # cv2.imwrite('arena.png', imgArena)
