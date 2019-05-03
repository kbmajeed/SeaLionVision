from __future__ import division
#import sys
import os
import cv2
#import math
import numpy as np
#from matplotlib import pyplot as plt
#import tensorflow as tf


# Define File and Data sequence
url = "D:/Desky/Project/KaggleNOAASeaLions/Train"
#url = "D:/Desky/Project/KaggleNOAASeaLions/TrainDotted"
files = os.listdir(url)


# Image Acquisition and TempDir
Image = cv2.imread(url+'/'+files[0])
#Image = cv2.resize(Image, (800, 600))  
#cv2.imshow("SeaLion_Image",Image)
#cv2.waitKey(1000)
#cv2.destroyAllWindows()


# Function to Split Images to Card
#def cards(Image, Grid):
	#This function crops the image into region specific cards
h = Image.shape[0]                #Get dimensions of image
w = Image.shape[1]
N = 10
print h, w
#i = 1
#j = 1
scissors = np.array([[]*N]*N)
#label    = np.array([[]*N*N]*1)
for i in range(1,N+1):
    for j in range(1,N+1):
        x  = int(abs((i-1)*(w/N)))
        y  = int(abs((j-1)*(h/N)))
        xh = int(abs(i*w/N))
        yh = int(abs(j*h/N))
		   #scissors = [y:yh , x:xh] #cropped = Image[yh:y , xh:x]
        #label[i] = str(i)+str(j)
        cardspath = r"D:/Desky/Project/Cards" 
        #cardspath = r"D:/Desky/Project/Cards2" 
        if not os.path.exists(cardspath):
            os.makedirs(cardspath)
        cropped = Image[y:yh , x:xh]
        #cv2.imwrite(os.path.join(newpath, "Im_card"+str(i)+".jpg", cropped), [cv2.IMWRITE_JPEG_QUALITY,100]) 	#Save Card as New File
        #font = cv2.FONT_HERSHEY_SIMPLEX
        #cv2.putText(cropped,str(i)+str(j),(int(abs(y-yh)/2),int(abs(x-xh)/2)), font, 1,(255,255,255),2)
        cv2.imwrite(cardspath+"/"+"Im_card"+str(i)+str(j)+".jpg", cropped)
        cv2.imshow("SeaLion_Image",cropped)
        cv2.waitKey(25) #500
        cv2.destroyAllWindows()

        
#cropped_gray = cv2.cvtColor(cropped, cv2.COLOR_BGR2GRAY)
#Create SURF Feature Detector object
#surf = cv2.SURF()
# Only features, whose hessian is larger than hessianThreshold are retained by the detector
#surf.hessianThreshold = 10000
#keypoints, descriptors = surf.detectAndCompute(cropped_gray, None)
#print "Number of keypoints Detected: ", len(keypoints)
# Draw rich key points on input image
#cropped_surf = cv2.drawKeypoints(cropped, keypoints, flags=cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
#cv2.imshow('SURF Features', cropped_surf)
#cv2.waitKey()
#cv2.destroyAllWindows()




