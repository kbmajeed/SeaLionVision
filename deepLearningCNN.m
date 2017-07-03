%%                  DEEP LEARNING CNN NETWORK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEEPLEARNINGCNN (Abdulmajeed Muhammad Kabir(c)2017)
%
% deepLearningCNN function performs CNN training on extracted patches for
% a CNN based classification model
%
% Inputs: 
%   || train image folder
%   || test image folder
% Outputs: 
%   || convnet model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Convolutional Neural Network Architecture

digitDatasetPath = fullfile('D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\AllPatches');
%digitDatasetPath = fullfile('D:\Desky\AllPatches');
digitData        = imageDatastore(digitDatasetPath,'IncludeSubfolders',true,'LabelSource','foldernames');
CountLabel       = digitData.countEachLabel;
img              = readimage(digitData,1); size(img)
trainingNumFiles = 0.9;

rng(1) % For reproducibility

[trainDigitData,testDigitData] = splitEachLabel(digitData,trainingNumFiles,'randomize');

layers = [imageInputLayer([100 100 3])
          convolution2dLayer(10,5)
          reluLayer
          maxPooling2dLayer(2,'Stride',2)
          fullyConnectedLayer(5)
          softmaxLayer
          classificationLayer()];
      
functions = {@plotTrainingAccuracy, @(info) stopTrainingAtThreshold(info,95)};
options = trainingOptions('sgdm','MaxEpochs',15,'InitialLearnRate',0.0001,'Momentum',0.8);

%% Train Convnet Model

convnet = trainNetwork(trainDigitData, layers, options);

%% Test Convnet Model

YTest    = classify(convnet,testDigitData);
TTest    = testDigitData.Labels;
accuracy = sum(YTest == TTest)/numel(TTest); 
%accuracy = 0.9812;
    
imTest = imread('D:\Desky\PhD KFUPM\ICS 615 Advanced Computer Vision Sabri Mahmoud\Term Project\AllPatches\am\patch1_830480988.jpg');
classify(convnet, imTest)