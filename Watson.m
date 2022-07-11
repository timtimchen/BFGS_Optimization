function [f] = Watson(x)
% Watson function. 2 <= n <= 31, m = 31.
% n is depended on the dimension of input x.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P25.

    n = length(x);
    f = x(1)^2 + (x(2)-x(1)^2-1)^2; % f_30 and f_31 included
    for i = 1:29
        t = i / 29;
        f_i = 0;
        for j = 1:n
            f_i = f_i + x(j)*t^(j-1);
        end
        f_i = -f_i^2 - 1;
        for j = 2:n
            f_i = f_i + (j-1)*x(j)*t^(j-2);
        end
        f = f + f_i^2;
    end

end