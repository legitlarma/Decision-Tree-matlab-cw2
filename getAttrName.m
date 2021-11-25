function [z] = getAttrName(bestFeat)
switch bestFeat
    case 1
        z = "Variance of Wavelet Transformed Image";
    case 2
        z = "Skewness of Wavelet Transformed Image";
    case 3
        z = "Curtosis of Wavelet Transformed Image";
    case 4
        z = "Entropy of Image";
    otherwise
        z = 0;
end
