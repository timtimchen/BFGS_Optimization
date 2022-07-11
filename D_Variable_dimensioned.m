function [df] = D_Variable_dimensioned(x)
% This function performs the gradient of Variable dimensioned function.
% n is variable, depended on the input x, m = n+2. 
    
    n = length(x);
    j = (1:n);
    f_n = x - 1;
    f_n_1 = j * (x-1);
    
    df = 2 * f_n;
    for i = 1:n
        df(i) = df(i) + 2*f_n_1*i + 4*f_n_1^3*i;
    end

end