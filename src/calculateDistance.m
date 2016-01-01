function [averages, averages2, distInPx] = calculateDistance(A, B)
    distInPx = 0;
    
    C = (A - B) + (B - A);
    dim = size(C);
    level = graythresh(C);
    bw = im2bw(C, level);
    bw = bwareaopen(bw, 50);
    SE = strel('square', 20);
    bw = imdilate(bw,SE);
    SE = strel('arbitrary', eye(20));
    bw = imerode(bw,SE);
    
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