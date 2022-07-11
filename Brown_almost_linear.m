function [f] = Brown_almost_linear(x)
% Brown almost-linear function. n is variable, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P27.

    n = length(x);
    
    f_i = x + sum(x) - (n+1);
    f_i(n) = prod(x) - 1; % replace the f_n to the correct formular
    f = sum(f_i .^ 2);
end