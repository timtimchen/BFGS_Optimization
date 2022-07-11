function [f] = Beale(x)
% Brown badly scaled function. n=2, m=3.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P21.

    y = [1.5; 2.25; 2.635];
    f = 0;
    for i = 1:3
        f = f + (y(i) - x(1)*(1 - x(2)^i))^2;
    end
end