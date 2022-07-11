function [f] = Chebyquad(x)
% Chebyquad function. n is variable, m >= n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P29.

    %y is the shifted x
    n = length(x);
    m = n;
    y = 2 * x - 1;
    t0 = ones(n, 1);
    t1 = y;
    ti = t1;
    f = 0;
    for i = 1:m 
        if i > 1
            ti = 2 .* y .* t1 - t0;
            t0 = t1;
            t1 = ti;
        end
        fi = sum(ti) / n;
        if mod(i,2) == 0
            fi = fi + 1/(i^2 - 1);
        end
        f = f + fi^2;
    end
end