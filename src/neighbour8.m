function neighbours = neighbour8(bw, r,c)
    neighbours = [];
    dim = size(bw);
    for rx = r-1:r+1
        for cx = c-1:c+1
            if rx == r & cx == c
                continue
            end
            if rx < 1 | cx < 1 | rx > dim(1) | cx > dim(2) | bw(rx,cx) == 0
                continue
            end
            neighbours = [neighbours; rx,cx];
        end
    end
end