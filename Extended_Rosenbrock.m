function [f] = Extended_Rosenbrock(x)
% Extended Rosenbrock function. given by:
% dimension n must be even, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P26.

    k = round(length(x)/2);
    f = 0;
    for i = 1:k
        f = f + 100*(x(2*i) - x(2*i-1)^2)^2 + (1-x(2*i-1))^2;
    end
end