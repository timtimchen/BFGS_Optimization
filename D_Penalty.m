function [df] = D_Penalty(x)
% This function performs the gradient of Penalty function. n = 4, m = n+1. 
    alpha = 1e-5;
    df = 2 * alpha * (x - 1);
    df = df + 4 * (sum(x.^2)-1/4) * x;
end