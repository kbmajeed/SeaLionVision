function [ boxed ] = boundboxes( im, nel )
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BOUNDBOXES (Abdulmajeed Muhammad Kabir(c)2017)
%
% boundboxes function defines a bounding box on each input image
%
% Inputs: 
%   || im > image is the output of the dialate function (eg. bw_am_dialated)
% Outputs: 
%   || nel > number of dots (sea lions) detected in 'coordinates' function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
reg  = regionprops(im,'boundingbox'); 
% other properties: centroid, area, boundingbox
xtra = 25;
% increases size of bounding box by 'xtra' pixels

for i = 1:nel
     boxing    = reg(i).BoundingBox; 
     boxing(1) = boxing(1)*rng - xtra/2; 
     boxing(2) = boxing(2)*rng - xtra/2;
     boxing(3) = boxing(3)*rng + xtra; 
     boxing(4) = boxing(4)*rng + xtra;
     boxed     = boxing;
     rectangle('Position', reg(i).BoundingBox,'EdgeColor','r','LineWidth',1);
end


end

