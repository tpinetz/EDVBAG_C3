function [averages, averages2, distInPx] = calculateDistance(A, B, SEType)

C = (A - B) + (B - A);
level = otsuThreshold(C);

bw = im2bw(C, level);
elementSize = floor(min(size(bw,1),size(bw,2)) * 0.05);

SE = strel(SEType, elementSize);
[bw2] = dilation(bw,SE);
%[bw2] = imdilate(bw,SE);
[bw3] = erosion(bw2,SE);
%[bw3] = imerode(bw2,SE);

[bw3, cc] = myGetBiggestComponents(bw3);

figure('Name', 'After Closing'); imshow(bw3);
%figure('Name', 'matlabDilation'); imshow(bw);

%averages = [0,0];
%averages2 = [0,0];
%ave = 0;
%ave2 = 0;

%[nc, cc] = CCL(bw3, @neighbour8);

minx = 999999;
maxx = 0;


miny = 999999;
maxy = 0;


for idx = 1:size(cc{1},1)
    point = cc{1}(idx,:);
    minx = min(point(1), minx);
    maxx = max(point(1), maxx);
    
    miny = min(point(2), miny);
    maxy = max(point(2), maxy);
end

averages = [(maxx - minx) / 2 + minx, (maxy - miny) / 2 + miny];

minx = 999999;
maxx = 0;

miny = 999999;
maxy = 0;

for idx = 1:size(cc{2},1)
    point = cc{2}(idx,:);
    
    
    minx = min(point(1), minx);
    maxx = max(point(1), maxx);
    
    miny = min(point(2), miny);
    maxy = max(point(2), maxy);
end


averages2 = [(maxx - minx) / 2 + minx, (maxy - miny) / 2 + miny];

distInPx = sqrt((averages(1) - averages2(1))^2 + (averages(2) - averages2(2))^2);
end