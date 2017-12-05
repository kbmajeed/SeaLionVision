from __future__ import division
#import sys
import os
import cv2
#import math
#import numpy as np
#from matplotlib import pyplot as plt

url = "D:/Desky/Project/KaggleNOAASeaLions/Train"
files = os.listdir(url)
# Image Acquisition and TempDir

import random
rr = random.randint(1,101)
Image = cv2.imread(url+'/'+files[rr])
#Image = cv2.imread(url+'/'+files[115])

cropped_hsv = cv2.cvtColor(Image, cv2.COLOR_BGR2HSV)

#Gaussian Blurring
#cropped_hsv = cv2.GaussianBlur(cropped_hsv, (11,11), 5) #Again, you can change the kernel size
#cv2.imshow('Gaussian Blurring', cropped_hsv)
#cv2.waitKey(0)
#cv2.destroyAllWindows()
    
#cropped_hsv[:,:,2] = [0]
cv2.imshow('RGB Image', Image)
cv2.imshow('HSV image', cropped_hsv)
#cv2.imshow('Hue Channel',cropped_hsv[:,:,0])
#cv2.imshow('Saturation Channel',cropped_hsv[:,:,1])
#cv2.imshow('Value Channel',cropped_hsv[:,:,2])
cv2.waitKey(0) #5000
cv2.destroyAllWindows()


#
