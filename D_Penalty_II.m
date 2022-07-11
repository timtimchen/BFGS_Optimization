function [df] = D_Penalty_II(x)
% This function performs the gradient of Penalty II function. n = 4, m = 2n. 
    
    n = length(x);
    df = zeros(n,1);
    alpha = 1e-5;
    df(1) = 2*(x(1) - 0.2);
    % f_i, 2 <= i <= n
    for i = 2:n
        y = exp(i/10) + exp((i-1)/10);
        f_i = 2 * alpha * (exp(x(i)/10)+exp(x(i-1)/10)-y);
        df(i) = df(i) + f_i * exp(x(i)/10) / 10;
        df(i-1) = df(i-1) + f_i * exp(x(i-1)/10) / 10;
    end
    % f_i, n < i < 2n
    for i = n+1 : 2*n-1
        f_i = 2 * alpha * (exp(x(i-n+1)/10)-exp(-1/10));
        df(i-n+1) = df(i-n+1) + f_i * exp(x(i-n+1)/10) / 10;
    end
    part = 0;
    for j = 1:n
        part = part + (n-j+1)*x(j)^2;
    end
    f_i = 2 * (part - 1);
    for j = 1:n
        df(j) = df(j) + f_i * 2 * (n-j+1) * x(j);
    end

end