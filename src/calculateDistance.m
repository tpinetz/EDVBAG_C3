function [averages, averages2, distInPx] = calculateDistance(A, B)

C = (A - B) + (B - A);
level = graythresh(C);

bw = im2bw(C, level);
%bw = myAreaOpen(bw, 50);
SE = strel('square', 15);
[bw2] = dilation(bw,SE);
[bw3] = erosion(bw2,SE);
bw = imdilate(bw,SE);
bw = imerode(bw,SE);

%figure('Name', 'myDilation'); imshow(bw3);
%size(bw3)
%figure('Name', 'matlabDilation'); imshow(bw);
%size(bw)

averages = [0,0];
averages2 = [0,0];
ave = 0;
ave2 = 0;

[nc, cc] = CCL(bw, @neighbour8);

for point = cc{1}
    averages = averages + [point(1), point(2)];
    ave = ave + 1;
end

for point = cc{2}
    averages2 = averages2 + [point(1), point(2)];
    ave2 = ave2 + 1;
end

if ave > 0
    averages = averages / ave;
end

if ave2 > 0
    averages2 = averages2 / ave2;
end

distInPx = sqrt((averages(1) - averages2(1))^2 + (averages(2) - averages2(2))^2);

end