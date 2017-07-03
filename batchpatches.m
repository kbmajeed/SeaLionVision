function [ boxed, patch ] = batchpatches( im1, nel, urd, im2, url2 )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BATCHPATCHES (Abdulmajeed Muhammad Kabir(c)2017)
%
% batchpatches function extracts patches from TrainDotted images and writes
% to file in specified director
%
% Inputs: 
%   || im1 > dot-dilated image (eg. bw_am_dialated)
%   || nel > number of dots detected after centroid operation
%   || urd > name of SeaLion category sub-folder (eg. 'am' = adultMales)
%   || im2 > SeaLion 'Train 'image from which patch is to be extracted
%   || url2 > image is the output of the dialate function(eg. bw_am_dialated)
% Outputs: 
%   || boxed > coordinates of extracted patch
%   || im2 > patch image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PATCHES EXTRACTION

% Create url1 as the patch folder for image(i)
urd  = char(urd); url2 = char(url2); url1 = strcat(url2,'\',urd);
reg  = regionprops(im1,'boundingbox'); 
mkdir(url1); cd(url1)

for i = 1:nel
     boxing = reg(i).BoundingBox; 
     xtra = 50; %xtra = increase patch size by 'xtra' pixels
     boxing(1) = boxing(1) - xtra/2; 
     boxing(2) = boxing(2) - xtra/2;
     boxing(3) = boxing(3)+ xtra; 
     boxing(4) = boxing(4)+ xtra;
     boxed     = boxing;
     patch     = imcrop(im2,boxed); %extract patch around boundingbox
     %imshow(patch); %pause()
     %Write patch to url
     xav = ceil(randi([1,1000000000],1))+ceil(randi([1,1000],1)); 
     % use random name to avoid image overwriting when merging overall patches
     numrows = 100; numcols = 100;
%      Im_GPU_x = im2double(gpuArray(patch)); Im_GPU_y = imresize(Im_GPU_x,[numrows numcols]);
%      imwrite(Im_GPU_y, char(strcat('patch',num2str(abs(i)),'_',num2str(xav),'.jpg')));
     %patch = Im_GPU_y;
     patch = imresize(patch,[numrows numcols]);
     imwrite(patch, char(strcat('patch',num2str(abs(i)),'_',num2str(xav),'.jpg')));
     
end
    clc
    %cd here
end

