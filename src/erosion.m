function [ output_args ] = erosion(bw,SE)
%DILATION Summary of this function goes here
%   Detailed explanation goes here
dim = size(bw);
SEheight = getheight(SE);
outImg = zeros(size(bw));
x = size(SEheight,1);
y = size(SEheight,2);

tempImg = ones(dim(1)+x-1,dim(2)+y-1);
tempImg((x+1)/2:dim(1)+(x-1)/2,(y+1)/2:dim(2)+(y-1)/2) = bw;

for r = 1+(x-1)/2:dim(1)+(x-1)/2
    for c = 1+(y-1)/2:dim(2)+(y-1)/2
        if tempImg(r,c) == 0
            continue;
        end
        if tempImg(r,c) == 1
            nhood = getnhood(SE);
            if tempImg(r-(x-1)/2:r+(x-1)/2,c-(y-1)/2:c+(y-1)/2) == nhood
                outImg(r-(x-1)/2,c-(y-1)/2) = 1;
            end
        end
    end
end
output_args = outImg;
end