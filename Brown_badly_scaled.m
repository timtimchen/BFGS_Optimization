function [f] = Brown_badly_scaled(x)
% Brown badly scaled function. n=2, m=3.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P21.

    f = (x(1) - 1e6)^2 + (x(2) - 2e-6)^2 + (x(1)*x(2) - 2)^2;
end