function [df] = D_Watson(x)
% This function performs the gradient of Watson function. 2 <= n <= 31, m = 31. 
% n is depended on the dimension of input x.

    n = length(x);
    df = zeros(n,1);
    for i = 1:29
        t = i / 29;
        f_part = 0;
        df_i = zeros(n,1);
        for j = 1:n
            f_part = f_part + x(j)*t^(j-1);
        end
        
        for j = 1:n
            df_i(j) = -2*f_part*t^(j-1);
        end
        
        for j = 2:n
            df_i(j) = df_i(j) + (j-1)*t^(j-2);
        end
        f_i = 0;
        for j = 1:n
            f_i = f_i + x(j)*t^(j-1);
        end
        f_i = -f_i^2 - 1;
        for j = 2:n
            f_i = f_i + (j-1)*x(j)*t^(j-2);
        end
        df = df + 2 * f_i * df_i;
    end
    
    df(1) = df(1) + 2*x(1) - 4*x(1)*(x(2)-x(1)^2-1); 
    df(2) = df(2) + 2*(x(2)-x(1)^2-1); 

end