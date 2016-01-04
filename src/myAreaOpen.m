function [ outputBW ] = myAreaOpen( bw, P )
    %AREAOPEN Summary of this function goes here
    %   Detailed explanation goes here
    outputBW = zeros(size(bw));

    % Determine the connected components:
    [~, CC] = CCL(bw, @neighbour8);

    for components = CC
        % Compute the area of each component:
        currentComponent = components{1};
        totalSize = size(components{1});
        currentSize = totalSize(1); % rows
        % Remove small objects:
        if(currentSize >= P)
            for point = currentComponent'
                outputBW(point(1),point(2)) = 1;
            end
        end
    end
end

