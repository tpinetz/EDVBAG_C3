function [ output_args ] = erosion(bw,SE)
%DILATION Summary of this function goes here
%   Detailed explanation goes here
dim = size(bw);
SEheight = getheight(SE);
outImg = zeros(size(bw));
x = size(SEheight,1);
y = size(SEheight,2);

tempImg = ones(dim(1)+2*x,dim(2)+2*y);
tempImg(x+1:dim(1)+x,y+1:dim(2) + y) = bw;

for r = x+1:dim(1)+x
    for c = y+1:dim(2)+y
        if tempImg(r,c) == 0
            continue;
        end
        if tempImg(r,c) == 1
            nhood = getnhood(SE);
            if tempImg(r-floor(x/2):r+floor((x-1)/2),c-floor(y/2):c+floor((y-1)/2)) >= nhood
                outImg(r-x,c-y) = 1;    
            end
        end
    end
end
output_args = outImg;
end