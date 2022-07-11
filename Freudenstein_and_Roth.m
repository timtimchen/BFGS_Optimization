function [f] = Freudenstein_and_Roth(x)
% Freudenstein and Roth function. n=2, m=2.
% Initial x0=(0.5, 2), the minimum is 48.9842 at x = (11.41, -0.8968).
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P21.

    f = (-13 + x(1) - 2*x(2) + 5*x(2)^2 -x(2)^3)^2 + (-29 + x(1) -14*x(2) + x(2)^2 + x(2)^3)^2;
end