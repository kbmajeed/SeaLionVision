# SeaLionVision

## Introduction
<p style="text-align: justify">
Over the last 30 years, the population of the Steller Sea lions have declined by 94% in western Aleutian. Due to this decline, well trained scientists at NOAA Fisheries Alaska Fisheries Centre counts the western Aleutian Sea Lions population annually by conducting surveys using air craft system to collect aerial images. An accurate estimation of the population can ensure the understanding of factors that may contribute to the lack of recovery of stellers in this area. Most often biologist spend up to 4 months counting sea lions from thousands of images collected by NOAA fisheries each year. </p>

## Description
In this work, a novel computer vision based algorithm to classify Sea lions in aerial into classes: adult males, sub adult males, adult females, juveniles and pup respectively. In the first stage, each of the aerial image from the dataset is divided into smaller box of images. Next, small patches are extracted from the smaller images based on categories; adult males, sub adult male, adult females, juvenile, and pups. In the final stage, we used this patches to train a convolutional neural network to classify the images.

```
(1) Image Acquisition and Data Processing
a. Acquire Images and Unzip data file
b. Acquire Images (70%) from ‘TrainDotted’
c. Convert ‘TrainDotted’ images to HSV color format
d. Perform color segmentation
e. Extract dotted blobs and find centroid
(2) Patches Extraction
a. Assign Bounding Box on each ‘TrainDotted’ blob
b. Resize Bounding Box and Crop region as Patches
c. Save Patches from all 5 classes to folder
d. Extract ‘rough’ patches containing “bush”, “sea” and “rocks”
e. Resize all Patches to 100 x 100 pixels
(3) Deep Learning (Convolutional Neural Networks)
a. Develop baseline CNN architecture
b. Use Patches and rough patches to train CNN
c. Save CNN model
(4) Testing (SURF + CNN)
a. Divide original NOAA images into 𝑁 segments
b. Use SURF on original NOAA images (30%) to detect interest points
c. Set SURF Hessian threshold: 5000
d. Extract patches size 100 x 100 pixels around interest points
e. Classify patch using CNN model.
```

## Results



