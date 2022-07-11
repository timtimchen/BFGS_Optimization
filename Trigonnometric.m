function [f] = Trigonnometric(x)
% Trigonnometric function. n is variable, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P27.

    n = length(x);
    s_cos = sum(cos(x));
    i = (1:n)';
    f_i = n - s_cos + i .* (1 - cos(x)) - sin(x);
    f = sum(f_i .^ 2);
end