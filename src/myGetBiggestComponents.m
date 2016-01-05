function [ outputBW ] = myGetBiggestComponents( bw)
    %myBiggestComponents returns an BW-Image containing the biggest two
    %Components (in white) of the Input-Image
    outputBW = zeros(size(bw));

    % Determine the connected components:
    [~, CC] = CCL(bw, @neighbour8);
    
    %initialize biggestComponents
    biggestComponent1 = CC{1};
    biggestComponent2 = CC{2};
    
    %isequal(biggestComponent1, biggestComponent1)
    %biggestComponent2 == biggestComponent1
    
    for components = CC
        % Compute the area of each component:
        currentComponent = components{1};
        totalComponentSize = size(components{1});
        currentSize = totalComponentSize(1); % rows
        
        %% initialize biggestSizes
        biggestSize1 = size(biggestComponent1);
        biggestSize2 = size(biggestComponent2);
        
        % Get biggest objects:
        if(isequal(currentSize, biggestSize1) && (~isequal(currentComponent, biggestComponent1)))
            biggestComponent1 = currentComponent;
        elseif(isequal(currentSize, biggestSize2) && (~isequal(currentComponent, biggestComponent2)))
            biggestComponent2 = currentComponent;
        end
    end
    
    for point = biggestComponent1'
        outputBW(point(1),point(2)) = 1;
    end

    for point = biggestComponent2'
        outputBW(point(1),point(2)) = 1;
    end
end

