function [df] = D_Brown_almost_linear(x)
% This function performs the gradient of Brown almost-linear function.
% n is variable, depended on the input x, m = n. 
    
    n = length(x);
    
    f_i = x + sum(x) - (n+1);
    f_i(n) = prod(x) - 1; % replace the f_n to the correct formular
    
    df = zeros(n, 1);
    for j = 1:n-1
        for k = 1:n 
            if j == k
                coef = 2;
            else
                coef = 1;
            end
            df(k) = df(k) + 2 * f_i(j) * coef;
        end
    end
    for k = 1:n
        df(k) = df(k) + 2*f_i(n)*prod(x)/x(k);
    end

end