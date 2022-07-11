function [df] = D_Trigonnometric(x)
% This function performs the gradient of Trigonnometric function.
% n is variable, depended on the input x, m = n. 
    
    n = length(x);
    s_cos = sum(cos(x));
    i = (1:n)';
    fi = n - s_cos + i .* (1 - cos(x)) - sin(x); % m functions
    
    df = zeros(n, 1);
    for j = 1:n
        for k = 1:n 
            df(k) = df(k) + 2 * fi(j) * (-sin(x(k)) + j * sin(x(k)) - cos(x(k)));
        end
    end

end