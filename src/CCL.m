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
            
            while sum(size(neighbours3)) > 0
                neighbours = neighbours3;
                neighbours3 = [];
                for i = neighbours'
                    if visited(i(1),i(2)) == 0 
                        visited(i(1),i(2)) = true;

                        neighbours2 = neighbourhood(bw,i(1),i(2));
                        neighbours3 = [neighbours3; neighbours2];
                        component = [component; i(1), i(2)];
                    end               
                end
            end
            components{numComponents + 1} = component;
            numComponents = numComponents + 1;
        end
    end
end