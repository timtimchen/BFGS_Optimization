function [f] = Penalty_II(x)
% Penalty II function. n is variable, depended on the input x, m = 2n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P26.

    n = length(x);
    alpha = 1e-5;
    f = (x(1) - 0.2)^2; % f_1
    % f_i, 2 <= i <= n
    for i = 2:n
        y = exp(i/10) + exp((i-1)/10);
        f = f + alpha * (exp(x(i)/10)+exp(x(i-1)/10)-y)^2;
    end
    % f_i, n < i < 2n
    for i = n+1 : 2*n-1
        f = f + alpha * (exp(x(i-n+1)/10)-exp(-1/10))^2;
    end
    part = 0;
    for j = 1:n
        part = part + (n-j+1)*x(j)^2;
    end
    f = f + (part - 1)^2;
end