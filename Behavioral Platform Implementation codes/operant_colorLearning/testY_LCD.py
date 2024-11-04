import sys
import os

curr_wd = str(os.getcwd())
# utilities_wd = curr_wd.replace(curr_wd.split('/')[-1],'Utilities')
utilities_wd = curr_wd.replace(curr_wd.split("\\")[-1], "Utilities")  # for windows
sys.path.insert(1, utilities_wd)
# sys.path.insert(1,"/Users/manna/Documents/git/yMaze_conditioning/Utilities")

import numpy as np
import cv2
import time
import unit_fly
import unitMaze as UM
import LCD
import random
import math
import serial
from serial.tools import list_ports
from datetime import date
import notifications

all_cool = input(
    "Check if IR light, Power supply for shocking and Power supply for the IC are connected and turned on (press enter to continue...)"
)
all_cool = input(
    "Check if both the powern button on the powersupply is turned on (press enter to continue...)"
)
all_cool = input(
    "Check if the second monitor (below the yMazes) is turned on (press enter to continue...)"
)
all_cool = input(
    "Check if the Arduino is connected to the Computer (press enter to continue...)"
)
all_cool = input("Check if you've turned off the CO2 pad (press enter to continue...)")
all_cool = input(
    "keep_me_up.py will now run, minimise any window that pops up (press enter to continue...)"
)
# all_cool = input("Run keep_me_up.py inside utilities (press enter to continue...)")
os.system('start python3 "' + utilities_wd + '/keep_me_up.py"')
all_cool = input(
    "The program will now get the bounding boxes for the mazes (press enter to continue...)"
)
os.system('python3 "' + utilities_wd + '/getBoxes_aruco_64.py"')

ports = serial.tools.list_ports.comports()

for i, port in enumerate(ports):
    print(i, port)
port_choice = int(input("Enter port number for Arduino: "))

s = serial.Serial()
# # s.port = '/dev/cu.usbmodem14801'
s.port = str(ports[port_choice][0])
s.baudrate = 115200
s.parity = "N"
s.bytesize = 8
s.stopbits = 1
s.open()

dateStr = date.today().strftime("%Y%m%d")
expStr = "exp" + input("enter experiment number:")
path = dateStr + "/" + expStr + "/"

assay_time = int(input("Enter time of assay (conditioning) (minutes): "))
assay_time_ns = assay_time * 60 * 1000000000 + 1000000000

noShock_all = input("Is this a full bias estimation assay (no flies will be shocked) [y/n]: ")

bias_assay_time = int(input("Enter time of pre (bias estimation) assay (minutes) [put 0 if full bias estimation assay]: "))
bias_assay_time_ns = bias_assay_time * 60 * 1000000000 + 1000000000  # 3 minutes

post_assay_time = int(input("Enter time of post (test) assay (minutes) [put 0 if full bias estimation assay]: "))
post_assay_time_ns = post_assay_time * 60 * 1000000000 + 1000000000 # 15 minutes

noShockControl_choice = input("Keep no shock controls (17-32 and 49-64) [y/n]: ")

pretraining_choice = input("Run pretraining before operant conditioning? [y/n]: ")

config_choice = input("Shock color [blue/green]:")
config_file = ""
if config_choice == "blue":
    config_file = curr_wd + "/config_blue.csv"
elif config_choice == "green":
    config_file = curr_wd + "/config_green.csv"

try:
    os.mkdir(dateStr)
except:
    pass
try:
    os.mkdir(path)
except:
    pass

file = open(path + "experiment_time.txt", "w")
file.write(time.asctime())
file.write("\n" + config_choice)
file.close()
del file

# define the starting patterns for 64 mazes as index of pat (in LCD.py) stating from 0
# patterns = [27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27]
p = 26  # all black
patterns = [p] * 64
LCD.updateLCD(patterns)

cap = cv2.VideoCapture(0)
# cap.open(1, apiPreference=cv2.CAP_ANY)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 4096)  # 1920 max for ROG eye; 4096 for imagingSource
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 3000)  # 1080 max for ROG eye; 3000 for imagingSource
cap.set(
    cv2.CAP_PROP_FPS, 30
)  # check documentation for what fps is supported at what resolution (30 fps at max resolution)

for i in range(50):  # take 50 images to stabilize as the camera auto focuses
    ret, img = cap.read()

# get box coordinates for individual mazes
# b_rect = np.loadtxt(
#     "C:/Users/manna/Documents/git/yMaze_conditioning/Utilities/boundingRectangles.csv",
#     dtype=int,
#     delimiter=",",
# )
b_rect = np.loadtxt(
    curr_wd + "/boundingRectangles.csv",
    dtype=int,
    delimiter=",",
)
n = len(b_rect)

# get shocking arm, initial pattern information, and pretraining configuration for individual mazes
# config.csv : initial pattern  shock arm   noShock pattern shock pattern
initial_config = np.genfromtxt(
    config_file,
    dtype=None,
    delimiter=",",
)
# int(initial_setting[i][0]); str(initial_setting[i][1],"utf-8")

# Initially set all 64 mazes to 'no shock' (O), for 'shock' use 'X'
shock_data = b"OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
data_to_send = shock_data

# initial 2 second shock to wake the flies up
time.sleep(1)
s.write(data_to_send)
time.sleep(2)
shock_data = b"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
data_to_send = shock_data
s.write(data_to_send)
time.sleep(2)
shock_data = b"OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
data_to_send = shock_data
s.write(data_to_send)
time.sleep(1)

fourcc = cv2.VideoWriter_fourcc(*"MP4V")
out1 = cv2.VideoWriter(path + "bw.mp4", fourcc, 30, (1365, 1000))
out2 = cv2.VideoWriter(path + "fg.mp4", fourcc, 30, (1365, 1000))
bias_out1 = cv2.VideoWriter(path + "bias_estimation_bw.mp4", fourcc, 30, (1365, 1000))
bias_out2 = cv2.VideoWriter(path + "bias_estimation_fg.mp4", fourcc, 30, (1365, 1000))
post_out1 = cv2.VideoWriter(path + "post_assay_bw.mp4", fourcc, 30, (1365, 1000))
post_out2 = cv2.VideoWriter(path + "post_assay_fg.mp4", fourcc, 30, (1365, 1000))

# all red
p = 26
patterns = [p] * 64
LCD.updateLCD(patterns)

# bias estimation

# bg_model = cv2.createBackgroundSubtractorMOG2()
bg_model = cv2.createBackgroundSubtractorKNN()  # works better than MOG2
bg_model.setDetectShadows(0)
# bg_model.setShadowThreshold()
# bg_model.setShadowValue()
# bg_model.setDist2Threshold()
bg_model.setHistory(100)  # default 500
# bg_model.setkNNSamples()
# bg_model.setNSamples()

bias_estimation_tracks = []
for i in range(n):
    obj = UM.unitMaze(img, i + 1)
    obj.noShockControl = noShockControl_choice
    obj.shockCol = str(initial_config[i][1])
    if obj.shockCol == "B":
        obj.noShockCol = "G"
    else:
        obj.noShockCol = "B"
    obj.pattern_pos = int(initial_config[i][0])
    obj.current_pattern = obj.pat[obj.pattern_pos]
    obj.mode = "bias"
    bias_estimation_tracks.append(obj)

bias_time_start_track = time.time()
while True:
    ret, img = cap.read()
    # fg = bg_model.apply(img)
    imgray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    fg = bg_model.apply(image=imgray)

    for i in range(n):  # use n to get all mazes
        x, y, w, h = b_rect[i]  # will only work with no. of arenas >1 [1d vs 2d array]
        temp_img = fg[y : y + h, x : x + w]
        bias_estimation_tracks[i].img = temp_img
        bias_estimation_tracks[i].addPos()
        pos_to_change = i
        # print(tracks[i].current_pattern)
        patterns[pos_to_change] = bias_estimation_tracks[i].pattern_pos
        shock_data = (
            shock_data[0:pos_to_change]
            + bias_estimation_tracks[i].shock
            + shock_data[pos_to_change + 1 :]
        )
        data_to_send = shock_data

        cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)
        # cv2.putText(img, str(i+1), (x,y), cv2.FONT_HERSHEY_COMPLEX, 2, (255, 255, 255))

    LCD.updateLCD(patterns)

    if time.time() - bias_time_start_track > 1.2:
        # print(data_to_send)
        s.write(data_to_send)
        bias_time_start_track = time.time()

    img_h, img_w, layers = img.shape
    img_h = int(img_h / 3)
    img_w = int(img_w / 3)

    temp = cv2.resize(img, (img_w, img_h))
    cv2.imshow("frame", temp)  # preview
    bias_out1.write(temp)
    temp = cv2.resize(fg, (img_w, img_h))
    cv2.imshow("foreground", temp)
    t = np.zeros((1000, 1365, 3), np.uint8)
    t[0:1000, 0:1365, 0] = temp
    t[0:1000, 0:1365, 1] = temp
    t[0:1000, 0:1365, 2] = temp
    bias_out2.write(t)

    if bias_estimation_tracks[-1].times[-1] > bias_assay_time_ns:
        break

    # time.sleep(1.2)
    if cv2.waitKey(1) & 0xFF == 27:
        break

time.sleep(2)
# turn off all the shocks
s.write(b"OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")

for i in range(n):
    print(bias_estimation_tracks[i].index)
    print(len(bias_estimation_tracks[i].track))
    np.savetxt(
        path + "bias_estimation_track_" + str(bias_estimation_tracks[i].index) + ".csv",
        bias_estimation_tracks[i].track,
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path + "bias_estimation_time_" + str(bias_estimation_tracks[i].index) + ".csv",
        bias_estimation_tracks[i].times,
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path + "bias_estimation_arm_" + str(bias_estimation_tracks[i].index) + ".csv",
        bias_estimation_tracks[i].arms,
        fmt="%s",
        delimiter=",",
    )
    np.savetxt(
        path
        + "bias_estimation_pattern_"
        + str(bias_estimation_tracks[i].index)
        + ".csv",
        bias_estimation_tracks[i].patterns,
        fmt="%s",
        delimiter=",",
    )
    np.savetxt(
        path + "bias_estimation_shock_" + str(bias_estimation_tracks[i].index) + ".csv",
        bias_estimation_tracks[i].shocks,
        fmt="%s",
        delimiter=",",
    )
    print(len(bias_estimation_tracks[i].truncated_arms))
    np.savetxt(
        path
        + "bias_estimation_truncated_arm_"
        + str(bias_estimation_tracks[i].index)
        + ".csv",
        bias_estimation_tracks[i].truncated_arms,
        fmt="%s",
        delimiter=",",
    )
    np.savetxt(
        path
        + "bias_estimation_truncated_time_"
        + str(bias_estimation_tracks[i].index)
        + ".csv",
        bias_estimation_tracks[i].truncated_times,
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path
        + "bias_estimation_scores_"
        + str(bias_estimation_tracks[i].index)
        + ".csv",
        [
            (
                bias_estimation_tracks[i].total_choices,
                bias_estimation_tracks[i].no_correct,
                bias_estimation_tracks[i].no_incorrect,
            )
        ],
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path
        + "bias_estimation_cummulative_scores_"
        + str(bias_estimation_tracks[i].index)
        + ".csv",
        bias_estimation_tracks[i].scores,
        fmt="%i",
        delimiter=",",
    )

del bias_estimation_tracks

# pretraining
time_shock = 2
time_no_shock = 4
num_cycle = 10
num_tr = 0
pre_train = True
delay = time_no_shock
if pretraining_choice == "n":
    pre_train = False
while pre_train:
    num_tr += 1
    time.sleep(delay)
    if num_tr % 2 == 1:
        # p = 0
        # patterns = [p] * 64
        patterns = [
            initial_config[index][2] for index in range(64)
        ]  # pretraining_patterns[0].tolist()
        delay = time_no_shock
        shock_data = b"OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
        data_to_send = shock_data
    else:
        # p = 13
        # patterns = [p] * 64
        patterns = [
            initial_config[index][3] for index in range(64)
        ]  # pretraining_patterns[1].tolist()
        delay = time_shock
        shock_data = b"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        data_to_send = shock_data
    s.write(data_to_send)
    time.sleep(0.5)
    LCD.updateLCD(patterns)
    if num_tr == 2 * num_cycle + 1:
        pre_train = False
    if cv2.waitKey(1) & 0xFF == 27:
        break

# operant

# bg_model = cv2.createBackgroundSubtractorMOG2()
bg_model = cv2.createBackgroundSubtractorKNN()  # works better than MOG2
bg_model.setDetectShadows(0)
# bg_model.setShadowThreshold()
# bg_model.setShadowValue()
# bg_model.setDist2Threshold()
bg_model.setHistory(100)  # default 500
# bg_model.setkNNSamples()
# bg_model.setNSamples()

tracks = []
for i in range(n):
    obj = UM.unitMaze(img, i + 1)
    obj.noShockControl = noShockControl_choice
    obj.noShock_all = noShock_all
    obj.shockCol = str(initial_config[i][1])
    if obj.shockCol == "B":
        obj.noShockCol = "G"
    else:
        obj.noShockCol = "B"
    obj.pattern_pos = int(initial_config[i][0])
    obj.current_pattern = obj.pat[obj.pattern_pos]
    obj.mode = "test"
    tracks.append(obj)

time_start_track = time.time()
while True:
    ret, img = cap.read()
    # fg = bg_model.apply(img)
    imgray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    fg = bg_model.apply(image=imgray)

    for i in range(n):  # use n to get all mazes
        x, y, w, h = b_rect[i]  # will only work with no. of arenas >1 [1d vs 2d array]
        temp_img = fg[y : y + h, x : x + w]
        tracks[i].img = temp_img
        tracks[i].addPos()
        pos_to_change = i
        # print(tracks[i].current_pattern)
        patterns[pos_to_change] = tracks[i].pattern_pos
        shock_data = (
            shock_data[0:pos_to_change]
            + tracks[i].shock
            + shock_data[pos_to_change + 1 :]
        )
        data_to_send = shock_data

        cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)
        # cv2.putText(img, str(i+1), (x,y), cv2.FONT_HERSHEY_COMPLEX, 2, (255, 255, 255))

    LCD.updateLCD(patterns)

    if time.time() - time_start_track > 1.2:
        # print(data_to_send)
        s.write(data_to_send)
        time_start_track = time.time()

    img_h, img_w, layers = img.shape
    img_h = int(img_h / 3)
    img_w = int(img_w / 3)

    temp = cv2.resize(img, (img_w, img_h))
    cv2.imshow("frame", temp)  # preview
    out1.write(temp)
    temp = cv2.resize(fg, (img_w, img_h))
    cv2.imshow("foreground", temp)
    t = np.zeros((1000, 1365, 3), np.uint8)
    t[0:1000, 0:1365, 0] = temp
    t[0:1000, 0:1365, 1] = temp
    t[0:1000, 0:1365, 2] = temp
    out2.write(t)

    if tracks[-1].times[-1] > assay_time_ns:
        break

    # time.sleep(1.2)
    if cv2.waitKey(1) & 0xFF == 27:
        break

time.sleep(2)
# turn off all the shocks
s.write(b"OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")

for i in range(n):
    print(tracks[i].index)
    print(len(tracks[i].track))
    np.savetxt(
        path + "track_" + str(tracks[i].index) + ".csv",
        tracks[i].track,
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path + "time_" + str(tracks[i].index) + ".csv",
        tracks[i].times,
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path + "arm_" + str(tracks[i].index) + ".csv",
        tracks[i].arms,
        fmt="%s",
        delimiter=",",
    )
    np.savetxt(
        path + "pattern_" + str(tracks[i].index) + ".csv",
        tracks[i].patterns,
        fmt="%s",
        delimiter=",",
    )
    np.savetxt(
        path + "shock_" + str(tracks[i].index) + ".csv",
        tracks[i].shocks,
        fmt="%s",
        delimiter=",",
    )
    print(len(tracks[i].truncated_arms))
    np.savetxt(
        path + "truncated_arm_" + str(tracks[i].index) + ".csv",
        tracks[i].truncated_arms,
        fmt="%s",
        delimiter=",",
    )
    np.savetxt(
        path + "truncated_time_" + str(tracks[i].index) + ".csv",
        tracks[i].truncated_times,
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path + "scores_" + str(tracks[i].index) + ".csv",
        [
            (
                tracks[i].total_choices,
                tracks[i].no_correct,
                tracks[i].no_incorrect,
            )
        ],
        fmt="%i",
        delimiter=",",
    )
    np.savetxt(
        path + "cummulative_scores_" + str(tracks[i].index) + ".csv",
        tracks[i].scores,
        fmt="%i",
        delimiter=",",
    )

if post_assay_time != 0:
    # post assay

    # bg_model = cv2.createBackgroundSubtractorMOG2()
    bg_model = cv2.createBackgroundSubtractorKNN()  # works better than MOG2
    bg_model.setDetectShadows(0)
    # bg_model.setShadowThreshold()
    # bg_model.setShadowValue()
    # bg_model.setDist2Threshold()
    bg_model.setHistory(100)  # default 500
    # bg_model.setkNNSamples()
    # bg_model.setNSamples()

    post_assay_tracks = []
    for i in range(n):
        obj = UM.unitMaze(img, i + 1)
        obj.noShockControl = noShockControl_choice
        obj.shockCol = str(initial_config[i][1])
        if obj.shockCol == "B":
            obj.noShockCol = "G"
        else:
            obj.noShockCol = "B"
        obj.pattern_pos = tracks[i].pattern_pos
        obj.current_pattern = obj.pat[obj.pattern_pos]
        obj.mode = "bias"
        post_assay_tracks.append(obj)

    del tracks

    post_assay_time_start_track = time.time()
    while True:
        ret, img = cap.read()
        # fg = bg_model.apply(img)
        imgray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        fg = bg_model.apply(image=imgray)

        for i in range(n):  # use n to get all mazes
            x, y, w, h = b_rect[
                i
            ]  # will only work with no. of arenas >1 [1d vs 2d array]
            temp_img = fg[y : y + h, x : x + w]
            post_assay_tracks[i].img = temp_img
            post_assay_tracks[i].addPos()
            pos_to_change = i
            # print(tracks[i].current_pattern)
            patterns[pos_to_change] = post_assay_tracks[i].pattern_pos
            shock_data = (
                shock_data[0:pos_to_change]
                + post_assay_tracks[i].shock
                + shock_data[pos_to_change + 1 :]
            )
            data_to_send = shock_data

            cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)
            # cv2.putText(img, str(i+1), (x,y), cv2.FONT_HERSHEY_COMPLEX, 2, (255, 255, 255))

        LCD.updateLCD(patterns)

        if time.time() - post_assay_time_start_track > 1.2:
            # print(data_to_send)
            s.write(data_to_send)
            post_assay_time_start_track = time.time()

        img_h, img_w, layers = img.shape
        img_h = int(img_h / 3)
        img_w = int(img_w / 3)

        temp = cv2.resize(img, (img_w, img_h))
        cv2.imshow("frame", temp)  # preview
        post_out1.write(temp)
        temp = cv2.resize(fg, (img_w, img_h))
        cv2.imshow("foreground", temp)
        t = np.zeros((1000, 1365, 3), np.uint8)
        t[0:1000, 0:1365, 0] = temp
        t[0:1000, 0:1365, 1] = temp
        t[0:1000, 0:1365, 2] = temp
        post_out2.write(t)

        if post_assay_tracks[-1].times[-1] > post_assay_time_ns:
            break

        # time.sleep(1.2)
        if cv2.waitKey(1) & 0xFF == 27:
            break

    time.sleep(2)
    # turn off all the shocks
    s.write(b"OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")

    for i in range(n):
        print(post_assay_tracks[i].index)
        print(len(post_assay_tracks[i].track))
        np.savetxt(
            path + "post_assay_track_" + str(post_assay_tracks[i].index) + ".csv",
            post_assay_tracks[i].track,
            fmt="%i",
            delimiter=",",
        )
        np.savetxt(
            path + "post_assay_time_" + str(post_assay_tracks[i].index) + ".csv",
            post_assay_tracks[i].times,
            fmt="%i",
            delimiter=",",
        )
        np.savetxt(
            path + "post_assay_arm_" + str(post_assay_tracks[i].index) + ".csv",
            post_assay_tracks[i].arms,
            fmt="%s",
            delimiter=",",
        )
        np.savetxt(
            path + "post_assay_pattern_" + str(post_assay_tracks[i].index) + ".csv",
            post_assay_tracks[i].patterns,
            fmt="%s",
            delimiter=",",
        )
        np.savetxt(
            path + "post_assay_shock_" + str(post_assay_tracks[i].index) + ".csv",
            post_assay_tracks[i].shocks,
            fmt="%s",
            delimiter=",",
        )
        print(len(post_assay_tracks[i].truncated_arms))
        np.savetxt(
            path
            + "post_assay_truncated_arm_"
            + str(post_assay_tracks[i].index)
            + ".csv",
            post_assay_tracks[i].truncated_arms,
            fmt="%s",
            delimiter=",",
        )
        np.savetxt(
            path
            + "post_assay_truncated_time_"
            + str(post_assay_tracks[i].index)
            + ".csv",
            post_assay_tracks[i].truncated_times,
            fmt="%i",
            delimiter=",",
        )
        np.savetxt(
            path + "post_assay_scores_" + str(post_assay_tracks[i].index) + ".csv",
            [
                (
                    post_assay_tracks[i].total_choices,
                    post_assay_tracks[i].no_correct,
                    post_assay_tracks[i].no_incorrect,
                )
            ],
            fmt="%i",
            delimiter=",",
        )
        np.savetxt(
            path
            + "post_assay_cummulative_scores_"
            + str(post_assay_tracks[i].index)
            + ".csv",
            post_assay_tracks[i].scores,
            fmt="%i",
            delimiter=",",
        )

    del post_assay_tracks

cap.release()
cv2.destroyAllWindows()

message = """\
Subject: JaksicLab Cognitive Experiments

Experiment done for Genotype: """
message = (
    message
    + expStr[3:]
    + """.\
    <this is a python generated notification>"""
)

notifications.send_mail("riddha.manna@epfl.ch", message)
notifications.send_mail("ana.jaksic@epfl.ch", message)
notifications.send_mail("goncalo.braga@epfl.ch", message)
