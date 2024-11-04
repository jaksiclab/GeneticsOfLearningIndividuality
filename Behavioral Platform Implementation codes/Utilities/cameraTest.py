import numpy as np
import cv2

cap = cv2.VideoCapture(0)
# cap.open(1, apiPreference=cv2.CAP_ANY)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 4096)  # 1920 max for ROG eye; 4096 for imagingSource
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 3000)  # 1080 max for ROG eye; 3000 for imagingSource
cap.set(
    cv2.CAP_PROP_FPS, 30
)  # check documentation for what fps is supported at what resolution (30 fps at max resolution)
capcol = cv2.VideoCapture(1)
# cap.open(1, apiPreference=cv2.CAP_ANY)
capcol.set(
    cv2.CAP_PROP_FRAME_WIDTH, 4096
)  # 1920 max for ROG eye; 4096 for imagingSource
capcol.set(
    cv2.CAP_PROP_FRAME_HEIGHT, 3000
)  # 1080 max for ROG eye; 3000 for imagingSource
capcol.set(
    cv2.CAP_PROP_FPS, 30
)  # check documentation for what fps is supported at what resolution (30 fps at max resolution)
# cap.set(cv2.CAP_PROP_CONVERT_RGB, 1)
bg_model = cv2.createBackgroundSubtractorKNN()  # works better than MOG2
bg_model.setDetectShadows(0)
bg_model.setHistory(500)
while True:
    ret, img = cap.read()
    retcol, imgcol = capcol.read()
    imgray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # imgray=img
    # imgray = cv2.fastNlMeansDenoising(imgray,None,3,7,21)
    fg = bg_model.apply(image=imgray)

    # contours, hierarchy = cv2.findContours(fg, cv2.RETR_CCOMP, cv2.CHAIN_APPROX_SIMPLE)
    # for i,cnt in enumerate(contours):
    #
    #     M = cv2.moments(cnt) #moments of the contour (fly)
    #     area = cv2.contourArea(cnt)
    #     if (M["m00"] != 0 and area > 200 and area < 300) :
    #         cX = int(M["m10"]/M["m00"]) #centroid X of fly
    #         cY = int(M["m01"]/M["m00"]) #centroid Y of fly
    #         cv2.circle(img, (cX, cY), 5, (64,64,64), 3)
    #         # cv2.drawContours(img, contours,i, (255, 0, 0), 3)
    #         break

    h, w, layers = img.shape
    h = int(h / 3)
    w = int(w / 3)
    temp = cv2.resize(img, (w, h))
    cv2.imshow("bw", temp)
    temp = cv2.resize(imgcol, (w, h))
    cv2.imshow("col", temp)
    temp = cv2.resize(fg, (w, h))
    cv2.imshow("fg", temp)
    if cv2.waitKey(1) & 0xFF == 27:
        break
cap.release()
cv2.destroyAllWindows()
