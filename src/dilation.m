function [ output_args ] = dilation(bw,SE)
%DILATION Summary of this function goes here
%   Detailed explanation goes here
dim = size(bw);
SEheight = getheight(SE);
outImg = zeros(dim(1)+size(SEheight,1)-1,dim(2)+size(SEheight,2)-1);
for r = 1:dim(1)
    for c = 1:dim(2)
        if bw(r,c) == 0
            continue;
        end
        if bw(r,c) == 1
            nhood = getnhood(SE);
            outImg(r:r+(size(SEheight,1)-1),c:c+(size(SEheight,2)-1)) = nhood;
        end
    end
end
output_args = outImg((size(SEheight,1)+1)/2:dim(1)+(size(SEheight,2)-1)/2,(size(SEheight,1)+1)/2:dim(2)+(size(SEheight,2)-1)/2);
end