function [f] = Powell_singular(x)
% Powell singular function. n = 4, m = 4. 
% x_0 = (3,-1,0,1) The true minimum is f = 0 at the origin.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P23.

    f = (x(1)+10*x(2))^2 + 5*(x(3)-x(4))^2 + (x(2)-2*x(3))^4 + 10*(x(1)-x(4))^4;
end