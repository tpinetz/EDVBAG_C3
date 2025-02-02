function [numComponents, components] = CCL(bw, neighbourhood)
    numComponents = 0;
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
            neighbours3 = neighbourhood(bw,r,c);
            component = [r,c];
            componentSize = 1;
            
            while sum(size(neighbours3)) > 0
                neighbours = neighbours3;
                neighbours3 = [];
                neighbourHoodSize = 1;
                for i = neighbours' %neighbours = [x1,y1; x2,y2; ... ; xn,yn]; neighbours' = [x1, x2, ..., xn; y1, y2, ..., yn] (transposed)
                    if visited(i(1),i(2)) == 0 
                        visited(i(1),i(2)) = 1;
                        component(componentSize,:) = [i(1), i(2)];
                        componentSize = componentSize + 1;

                        neighbours2 = neighbourhood(bw,i(1),i(2)); % neighbourhood of current neighbour                        
                        sizeNextNeighbourhood = size(neighbours2,1);
                        
                        if sizeNextNeighbourhood > 0 
                            temp = neighbourHoodSize + sizeNextNeighbourhood - 1;
                            neighbours3(neighbourHoodSize:temp,:) = neighbours2;  % total neighbourhood
                            neighbourHoodSize = temp + 1;
                        end
                    end               
                end
            end
            components{numComponents + 1} = component;
            numComponents = numComponents + 1;
        end
    end
end