%
%% MAIN: Patch Coordinates Function
%
% (c) Abdulmajeed Muhammad Kabir, May-2017
%  NOAA Sealions Population Project

%% Put Necessary Files in Matlab Path 
% This function to extract the coordinates of labelled ground truth 
clc; clear; here = pwd;
addpath(genpath('D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud'))

%% Categories 
%|Color   |SeaLionType   |FolderNames|
% red:     adult males    (am)
% magenta: subadult males (sm)
% brown:   adult females  (af)
% blue:    juveniles      (ju)
% green:   pups           (pp)

%% Im1age Data Acquisition
%Im1 = imread('D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\KaggleNOAASeaLions\TrainDotted\0.jpg');

%% Initialization for Extraction of Patches

% Directory link to SeaLion 'TrainDotted' files
url1 = ('D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\KaggleNOAASeaLions\TrainDotted');

% Directory link to 'Train' files
url2 = ('D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\KaggleNOAASeaLions\Train');

% Percentage of 'Train' files to extract Sea Lion patches from
Percentage    = 1;%

% 'extractor' function extracts urls of images in location Sea Lion url1
file_extracts1 = extractor(url1, Percentage);

% 'extractor' function extracts urls of images in location Sea Lion url2
file_extracts2 = extractor(url2, Percentage);

%% Patch extraction loop

for kk = 1:grab-2
Im1  = imread( char(strcat(char(url1),'\', char(file_extracts1{kk}))));
Im2  = imread( char(strcat(char(url2),'\', char(file_extracts2{kk}))));

%% Color masks for Segmentation of 'Dotted_Train' images

[bw_am, ic_am] = redMask_adultMales(Im1);
[bw_sm, ic_sm] = magentaMask2_subadultMales(Im1);
[bw_ju, ic_ju] = blueMask2_juveniles(Im1);
[bw_af, ic_af] = brownMask_adultFemales(Im1);
[bw_pp, ic_pp] = greenMask_pups(Im1);

%% Dilate colored image dots with 'dialate' function

bw_am_dialated = dialate(bw_am, 3);
bw_sm_dialated = dialate(bw_sm, 3);
bw_ju_dialated = dialate(bw_ju, 3);
bw_af_dialated = dialate(bw_af, 3);
bw_pp_dialated = dialate(bw_pp, 3);

%% Centroid

[centroid_am_coordinates, nel_am] = coordinates(bw_am_dialated);
[centroid_sm_coordinates, nel_sm] = coordinates(bw_sm_dialated);
[centroid_ju_coordinates, nel_ju] = coordinates(bw_ju_dialated);
[centroid_af_coordinates, nel_af] = coordinates(bw_af_dialated);
[centroid_pp_coordinates, nel_pp] = coordinates(bw_pp_dialated);

%% Coordinate detection and bounding box estimation

%%% figure(1);imshow(bw_sm_dialated); %figure(1);imshow(ic_sm);
% figure(1); imshow(Im1); box_am = boundBoxes(bw_am_dialated, nel_am);
% figure(2); imshow(Im1); box_sm = boundBoxes(bw_sm_dialated, nel_sm);
% figure(3); imshow(Im1); box_ju = boundBoxes(bw_ju_dialated, nel_ju);
% figure(4); imshow(Im1); box_af = boundBoxes(bw_af_dialated, nel_af);
% figure(5); imshow(Im1); box_pp = boundBoxes(bw_pp_dialated, nel_pp);

%% Extract Patches from Sea Lion'Train' images

% Create patch folder for each patch-extraction image
url3 = strcat('D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\Patches_',int2str(kk));
mkdir(url3); cd(url3); 

% Im1 = SeaLion 'Train 'image from which patch is to be extracted
% Im2 = SeaLion 'TrainDotted' image from which patch is to be extracted

if nel_am > 0
 %Extract patch from 'Train_Dotted'
 figure(1); imshow(Im1); box_am = batchpatches(bw_am_dialated, nel_am, 'am', Im1, url3); 
 %Extract patch from 'Train'
 %figure(1); imshow(Im1); box_am = batchpatches(bw_am_dialated, nel_am, 'am', Im2, url3); 
end

if nel_sm > 0
 %Extract patch from 'Train_Dotted'
 figure(2); imshow(Im1); box_sm = batchpatches(bw_sm_dialated, nel_sm, 'sm', Im1, url3);
 %Extract patch from 'Train'
 %figure(2); imshow(Im2); box_sm = batchpatches(bw_sm_dialated, nel_sm, 'sm', Im2, url3);
end

if nel_ju > 0
 %Extract patch from 'Train_Dotted'
 figure(3); imshow(Im1); box_ju = batchpatches(bw_ju_dialated, nel_ju, 'ju', Im1, url3);
 %Extract patch from 'Train'
 %figure(3); imshow(Im2); box_ju = batchpatches(bw_ju_dialated, nel_ju, 'ju', Im2, url3);
end

if nel_af > 0
 %Extract patch from 'Train_Dotted'
 figure(4); imshow(Im1); box_af = batchpatches(bw_af_dialated, nel_af, 'af', Im1, url3);
 %Extract patch from 'Train'
 %figure(4); imshow(Im2); box_af = batchpatches(bw_af_dialated, nel_af, 'af', Im2, url3);
end

if nel_pp > 0
 %Extract patch from Train_Dotted
 figure(5); imshow(Im1); box_pp = batchpatches(bw_pp_dialated, nel_pp, 'pp', Im1, url3);
 %Extract patch from 'Train'
 %figure(5); imshow(Im2); box_pp = batchpatches(bw_pp_dialated, nel_pp, 'pp', Im2, url3);
end

%%

%cd ../

end
