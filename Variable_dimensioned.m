function [f] = Variable_dimensioned(x)
% Variable dimensioned function. n is variable, depended on the input x, m = n+2. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P27.

    n = length(x);
    j = (1:n);
    f_n = x - 1;
    f_n_1 = j * (x-1);
    f_n_2 = f_n_1^2;
    
    f = sum(f_n .^ 2) + f_n_1^2 + f_n_2^2;
end