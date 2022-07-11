function [f] = Penalty(x)
% Penalty function. n = 4, m = n+1. 
% x_0 = (1,2,3,4) The true minimum is f = 0.0000224997.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P26.

    alpha = 1e-5;
    f = alpha * sum((x-1).^2) + (sum(x.^2)-1/4)^2;
end