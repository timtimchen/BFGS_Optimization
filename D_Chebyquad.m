function [df] = D_Chebyquad(x)
% This function performs the gradient of Chebyquad function. n is variable, m >= n. 
%

    %y is the shifted x
    n = length(x);
    m = n;
    y = 2 * x - 1;
    g0 = zeros(n, 1);
    g1 = ones(n, 1);
    t0 = ones(n, 1);
    t1 = y;
    ti = t1;
    gi = g1;
    df = zeros(n, 1);
    for i = 1:m 
        if i > 1
            gi = 2 .* t1 + 2 .* y .* g1 - g0;
            g0 = g1;
            g1 = gi;

            ti = 2 .* y .* t1 - t0;
            t0 = t1;
            t1 = ti;
        end
        gi = 2 .* gi ./ n;
        fi = sum(ti) / n;
        if mod(i,2) == 0
            fi = fi + 1/(i^2 - 1);
        end
        df = df + 2 .* fi .* gi;
    end
end