function [ outputBW, biggestComponents ] = myGetBiggestComponents( bw)
    %myBiggestComponents returns an BW-Image containing the biggest two
    %Components (in white) of the Input-Image
    outputBW = zeros(size(bw));

    % Determine the connected components:
    [~, CC] = CCL(bw, @neighbour8);
    
    %initialize biggestComponents
    biggestComponent1 = CC{1};
    biggestComponent2 = CC{2};
    % initialize biggestSizes
    biggestTotalSize1 = size(biggestComponent1);
    biggestSize1 = biggestTotalSize1(1);
    
    for components = CC
        % Compute the area of each component:
        currentComponent = components{1};
        totalComponentSize = size(currentComponent);
        currentSize = totalComponentSize(1); % rows
        
        % Get biggest objects:
        if((currentSize> biggestSize1) && (~isequal(currentComponent, biggestComponent1)))
            biggestComponent2 = biggestComponent1;
            biggestComponent1 = currentComponent;
            biggestSize1 = currentSize;
        end
    end
    
    for point = biggestComponent1'
        outputBW(point(1),point(2)) = 1;
    end

    for point = biggestComponent2'
        outputBW(point(1),point(2)) = 1;
    end
    biggestComponents{1} = biggestComponent1;
    biggestComponents{2} = biggestComponent2;
end

