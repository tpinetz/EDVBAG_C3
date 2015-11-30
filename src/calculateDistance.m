function [averages, averages2,dist] = calculateDistance(A, B)
    dist = 0;
    
    C = (A - B) + (B - A);
    dim = size(C);
    level = graythresh(C);
    bw = im2bw(C, level);
    bw = bwareaopen(bw, 50);
    SE = strel('square', 20);
    bw = imdilate(bw,SE);
    SE = strel('arbritrary', eye(20))
    bw = imerode(bw,SE);
    
    averages = [0,0];
    averages2 = [0,0];
    ave = 0;
    ave2 = 0;

    for x = 1 : dim(1)
        for y = 1 : floor(size(bw,2)/2)
            if(bw(x,y)) 
                averages(1) = averages(1) + x;
                averages(2) = averages(2) + y;
                ave = ave + 1;
            end
        end
        for y = ceil(size(bw,2)/2) : size(bw,2)
            if(bw(x,y))
                averages2 = averages2 + [x, y];
                ave2 = ave2 + 1;
            end
        end
    end
    
    if ave > 0
        averages = averages / ave;
    end
    
    if ave2 > 0
        averages2 = averages2 / ave2;
    end
    
    dist = sqrt((averages(1) - averages2(1))^2 + (averages(2) - averages2(2))^2);
    
end