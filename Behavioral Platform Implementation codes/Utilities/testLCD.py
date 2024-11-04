import sys

# sys.path.insert(1,"C:/Users/manna/Documents/git/yMaze_conditioning/Utilities")
sys.path.insert(1, "/Users/manna/Documents/git/yMaze_conditioning/Utilities")
import LCD
import numpy as np
import cv2
import math
import time

# p = 26
# patterns = [p]*64
# LCD.updateLCD(patterns)
# while True:
#     # ret, img = cap.read()
#     # # fg = bg_model.apply(img)
#     # imgray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#     val = input("enter command: ")
#     if(val == 'quit'):
#         break
#     col = int(val)
#     p = col
#     for i in range(64):
#         patterns[i]=p
#     LCD.updateLCD(patterns)
#     if cv2.waitKey(1) & 0xFF == 27:
#         break
# cv2.destroyAllWindows()

time_shock = 2
time_no_shock = 4
num_cycle = 10
num_tr = 0
pre_train = True
delay = 0
while pre_train:
    num_tr += 1
    time.sleep(delay)
    if num_tr % 2 == 1:
        p = 0
        patterns = [p] * 64
        delay = time_no_shock
    else:
        p = 13
        patterns = [p] * 64
        delay = time_shock
    LCD.updateLCD(patterns)
    if num_tr == 2 * num_cycle + 1:
        pre_train = False
    if cv2.waitKey(1) & 0xFF == 27:
        break
cv2.destroyAllWindows()
