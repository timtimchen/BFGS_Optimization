function [f] = Wood(x)
% Wood function. n = 4, m = 6. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P23.

    f = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2 + 90*(x(4)-x(3)^2)^2 + (1-x(3))^2 + 10*(x(2)+x(4)-2)^2 + (x(2)-x(4))^2/10;
end