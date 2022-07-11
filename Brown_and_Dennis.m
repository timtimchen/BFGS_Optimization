function [f] = Brown_and_Dennis(x)
% Brown and Dennis function. n = 4, m >= n. 
% x_0 = (25,5,-5,-1) The true minimum is f = 85822.2 if m = 20.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P24.

    f = 0.0;
    m = 20;
    for i = 1:m
        t = i / 5;
        f = f + ((x(1)+t*x(2)-exp(t))^2 + (x(3)+x(4)*sin(t)-cos(t))^2)^2;
    end
end