function [f] = Broyden_tridiagonal(x)
% Broyden tridiagonal function. n is variable, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P28.

    n = length(x);
    f = 0;
    f1 = 3*x(1) - 2*x(1)^2 - 2*x(2) + 1;
    f = f + f1^2;
    for i = 2:n-1
        fi = 3*x(i) - 2*x(i)^2 - x(i-1) - 2*x(i+1) + 1;
        f = f + fi^2;
    end
    fn = 3*x(n) - 2*x(n)^2 - x(n-1) + 1;
    f = f + fn^2;
end