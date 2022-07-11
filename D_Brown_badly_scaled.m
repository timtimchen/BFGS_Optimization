function [df] = D_Brown_badly_scaled(x)
% This function performs the gradient of Brown badly scaled function. n=2, m=2.
    
    df = zeros(2, 1);
    df(1) = 2*(x(1) - 1e6) + 2*(x(1)*x(2) - 2)*x(2); 
    df(2) = 2*(x(2) - 2e-6) + 2*(x(1)*x(2) - 2)*x(1);
end