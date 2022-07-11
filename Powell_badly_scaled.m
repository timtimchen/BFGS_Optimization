function [f] = Powell_badly_scaled(x)
% Powell badly function. n=2, m=2.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P21.

    f = (1000*x(1)*x(2) - 1)^2 + (exp(-x(1))+exp(-x(2))-1.0001)^2;
end