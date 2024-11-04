# datatype for storing and handling all relevant information for a single maze
import sys
import os

curr_wd = str(os.getcwd())
# utilities_wd = curr_wd.replace(curr_wd.split('/')[-1],'Utilities')
utilities_wd = curr_wd.replace(curr_wd.split("\\")[-1], "Utilities")  # for windows
sys.path.insert(1, utilities_wd)
# sys.path.insert(1,"/Users/manna/Documents/git/yMaze_conditioning/Utilities")

# datatype for storing and handling all relevant information for a single maze
import numpy as np
import cv2
import time
import serial
import unit_fly
import LCD
import random
import math


class unitMaze:
    def __init__(self, img, index):
        self.img = img
        self.index = index
        self.pattern_pos = 3  # in pat
        self.pat = [
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
        self.current_pattern = self.pat[self.pattern_pos]
        self.shockArm = "M"
        self.shock = b"O"
        self.lastX = -1
        self.lastY = -1
        self.track = [[]]
        self.track.pop(0)

        self.lastArm = "X"
        self.arms = []
        self.truncated_arms = []
        self.patterns = []
        self.shocks = []

        self.times = []
        self.truncated_times = []
        self.start = time.time_ns()

        self.no_correct = 0
        self.no_incorrect = 0
        self.total_choices = 0
        self.scores = [[0, 0, 0]]

        self.noShockControl = "n"
        self.mode = "test"  # set to "test" for normal test mode: keeps a track of everything; set to "bias" for bias estimation: no shocking
        self.noShock_all = "n"

    def addPos(self):
        unit_fly.init(self.img, self.index)
        x, y, arm, _time = unit_fly.get_pos()
        if (
            x == -1 or y == -1
        ):  # to retain the last position in case the program is not able to detect the fly (for eg. in the beginning, amd when the fly is not moving)
            x = self.lastX
            y = self.lastY
            arm = self.lastArm

        self.track.append([x, y])
        self.lastX = x
        self.lastY = y
        self.arms.append(arm)

        self.patterns.append(self.current_pattern)
        self.shocks.append(str(self.shock, "utf-8"))

        if arm == "X":
            arm = self.lastArm

        if arm != self.lastArm:
            self.total_choices = self.total_choices + 1
            self.truncated_arms.append(arm)
            self.truncated_times.append(_time - self.start)
            if arm == self.shockArm:
                self.no_incorrect = self.no_incorrect + 1
                self.shock = b"X"
            else:
                self.no_correct = self.no_correct + 1
                self.shock = b"O"

            self.scores.append([self.total_choices, self.no_correct, self.no_incorrect])

        self.lastArm = arm

        if self.noShockControl == "y":
            # if (self.index > 16 and self.index < 33) or ( #changed on 20240214due to technical issues
            #     self.index > 48 and self.index < 65
            # ):
            #     self.shock = b"O"
            if (self.index > 32) :
                self.shock = b"O"

        if self.mode == "bias":
            self.shock = b"O"

        if self.noShock_all == "y":
            self.shock = b"O"

        cv2.putText(
            self.img,
            str(self.shock, "utf-8"),
            (150, 50),
            cv2.FONT_HERSHEY_PLAIN,
            2,
            (127, 127, 127),
            5,
        )
        self.times.append(_time - self.start)
        # unit_fly.show()
