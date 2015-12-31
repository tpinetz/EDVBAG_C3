function [numComponents, components] = CCL(bw, neighbourhood)
    numComponents = 1;
    components = {};
    dim = size(bw);
    visited = zeros(dim);
    
    
    
    for r = 1:dim(1)
        for c = 1:dim(2)
            if bw(r,c) == 0
                continue;
            end
            if visited(r,c) == 1
                continue 
            end
            visited(r,c) = 1;
            neighbours = neighbourhood(bw,r,c);
            component = [r,c];

            component = [];
            for i = neighbours
                if visited(i(1),i(2)) == 0 
                    visited(i(1),i(2)) = true;
                    
                    neighbours2 = neighbourhood(bw,i(1),i(2));
                    neighbours = [neighbours; neighbours2];
                    component = [component; i(1), i(2)]
                end               
            end
            components{numComponents} = component;
            numComponents = numComponents + 1;
        end
    end
end