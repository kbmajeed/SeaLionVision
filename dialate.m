function [ bw_dialated ] = dialate( im , rr )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DIALATE (Abdulmajeed Muhammad Kabir(c)2017)
%
% dialate function enhances broken pixels 
%
% Inputs: 
%   || im > image is the output of the color mask segmentation (eg. bw_am)
% Outputs: 
%   || bw_dialated > resulting image after dilation process
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%Create a Octogonal structuring element with rr = 3; 
R = rr*3; SE = strel('octagon',R);

% Dilate the image with an octagonal SE.
bw_dialated = imdilate(im, SE);

%title('Original')
%imshow(BW), 

end

