function [f] = Box_3D(x)
% Box three-dimensional function. n = 3, m >= n. 
% x_0 = (0,10,20) The true minimum is f = 0 wherever x_1 = x_2 and x_3 = 0.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P23.

    m = 10;
    f = 0.0;
    for i = 1:m
        t = 0.1 * i;
        f = f + (exp(-t*x(1)) - exp(-t*x(2)) - x(3)*(exp(-t) -exp(-10*t)))^2;
    end

end