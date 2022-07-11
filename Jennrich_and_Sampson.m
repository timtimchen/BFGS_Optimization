function [f] = Jennrich_and_Sampson(x)
% Jennrich and Sampson function. given by:
%       f(x) = SUM_{i=1}^{m}(2+2*i-exp(i*x_1)-exp(i*x_2)) 
% where dimension n = 2. The true minimum is 124.362 at x = (0.2578, 0.2578) for m = 10.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P21.

    f = 0.0;
    m = 10;
    for i = 1:m
        f = f + (2+2*i-exp(i*x(1))-exp(i*x(2)))^2;
    end
end