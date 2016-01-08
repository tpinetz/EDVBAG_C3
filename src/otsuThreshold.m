function level = otsuThreshold(Image)
    Image = uint64(Image);
    minVal = 0;
    maxVal = 255;
    
    numHist = zeros(256,1);
    sumHist = double(size(Image,1) * size(Image,2));
    
    for r = 1: size(Image,1)
        for c = 1: size(Image,2)
            point = Image(r,c);
            numHist(point + 1) = numHist(point + 1) + 1;
        end
    end
    
    
    % Variable names taken from the paper A Threshold Selection Method
    % from Gray-Level Histograms by otsu

    p = numHist / sumHist;
    omega = [p(1)];
    mu = [p(1) * minVal];
    
    
    % Preprocessing of omega and mu values
    for val = (minVal+1):maxVal
        
        omega(val - minVal + 1,1) = omega(val - minVal,1) +  p(val-minVal + 1,1);
        mu(val - minVal + 1,1) = mu(val - minVal,1) +  double(val) * p(val-minVal + 1,1);
    end
    
    mu_t = mu(size(mu,1));
    sigma_squared = (mu_t * omega - mu) .^2 ./ (omega.*(1-omega)); % Formula 18 from the paper mentioned previosly
    
    maxSigma = sigma_squared(minVal + 1);
    level = minVal;
    countMax = 1;
    
    %find maximum
    for val = (minVal+1):maxVal
        if  ~isfinite(sigma_squared(val + 1))
            continue
        end
        if sigma_squared(val + 1) > maxSigma
            level = [val]; 
            countMax = 1;
            maxSigma = sigma_squared(val + 1);
        else
            if sigma_squared(val + 1) == maxSigma
                level(countMax + 1) =  val;
            end
        end
    end
    
    level = mean(level) / (maxVal); %normalize between [0 1].