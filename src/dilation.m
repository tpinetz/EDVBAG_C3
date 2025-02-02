function [ output_args ] = dilation(bw,SE)
%DILATION Summary of this function goes here
%   Detailed explanation goes here
dim = size(bw);
SEheight = getheight(SE);
x = size(SEheight,1);
y = size(SEheight,2);

outImg = zeros(dim(1)+2*x,dim(2)+2*y);
for r = 1:dim(1)
    for c = 1:dim(2)
        if bw(r,c) == 0
            continue;
        end
        if bw(r,c) == 1
            nhood = getnhood(SE);
            outImg(x+r:r+(2*x-1),y+c:c+(2*y-1)) = outImg(x+r:r+(2*x-1),y+c:c+(2*y-1)) | nhood;
        end
    end
end
output_args = outImg(x+1:dim(1)+x,y+1:dim(2)+y);
end