function [f] = Rosenbrock(x)
% rosenbrock function. given by:
%       f(x) = 100*(x(2) - x(1)^2)^2 + (1-x(1))^2 
% where dimension n = 2. The true minimum is 0 at x = (1,1).
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P21.

    f = 100*(x(2) - x(1)^2)^2 + (1-x(1))^2;
end