function [f] = Discrete_boundary_value(x)
% Discrete boundary value function. n is variable, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P27.

    n = length(x);
    n1 = (1:n)' + 1;
    h = 1 ./ n1;
    t = (1:n)' .* h;

    f = 0;
    f1 = 2*x(1) - x(2) + h(1)^2 * (x(1) + t(1) + 1)^3 / 2;
    f = f + f1^2;
    for i = 2:n-1
        fi = 2*x(i) - x(i-1) - x(i+1) + h(i)^2 * (x(i) + t(i) + 1)^3 / 2;
        f = f + fi^2;
    end
    fn = 2*x(n) - x(n-1) + h(i)^2 * (x(i) + t(i) + 1)^3 / 2;
    f = f + fn^2;
end