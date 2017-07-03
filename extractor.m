function [ extracts, grab ] = extractor( url, Percentage )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXTRACTOR (Abdulmajeed Muhammad Kabir(c)2017)
%
% eXtractor function extracts directory location of 'Percentage'% of images 
% in Sea Lion image folder location 'url1'
%
% Inputs: 
%   || url > Sea Lion 'Train' image folder urls
% Outputs: 
%   || extracts > Cell array containing directory location for eachimage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
Link      = url; cd(Link); 
batch     = ls; 
batch_len = size(batch);
grab      = ceil((Percentage/100)*(batch_len(1))); 
docs      = dir(Link);

extracts{ceil(grab-2)} = 0;

for i = 1:grab-2;
    extracts{i} = docs(i+2).name(1,:);
end

end

