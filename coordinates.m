function [ centroid_coordinates, nel ] = coordinates( im )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COORDINATES (Abdulmajeed Muhammad Kabir(c)2017)
%
% coordinates function extracts the centroid of dots in 'Train-Dotted' images
%
% Inputs: 
%   || im > image is the output of the dialate function (eg. bw_am_dialated)
% Outputs: 
%   || centroid_coordinates > resulting location of dots in the image
%   || nel > number of dots in the image corresponding to number of SeaLions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
reg = regionprops(im,'centroid');
cel = size(reg); 
nel = cel(1);

regl  = zeros(nel,2);
for i = 1:nel
    regl(i,1) = reg(i).Centroid(1);
    regl(i,2) = reg(i).Centroid(2);
end

centroid_coordinates = regl;

end

