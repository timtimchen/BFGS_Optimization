function [f] = Biggs_EXP6(x)
% Biggs EXP6 function. n = 6, m = 13. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P25.

    m = 13;
    t = 0.1 .* (1:m)';
    y = exp(-t) - 5.*exp(-10.*t) + 3.*exp(-4.*t);
    f_i = x(3).*exp(-t.*x(1)) - x(4).*exp(-t.*x(2)) + x(6).*exp(-t.*x(5)) - y;
    f = sum(f_i.^2);
end