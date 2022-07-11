function [df] = D_Jennrich_and_Sampson(x)
% This function performs the gradient of ampson function:
%       f(x) = SUM_{i=1}^{m}(2+2*i-exp(i*x_1)-exp(i*x_2)) at x. 
% where dimension n = 2, m = 10. 
    
    df = zeros(2, 1);
    m = 10;
    for i = 1:m
        df(1) = df(1) - 2*i*exp(i*x(1))*(2+2*i-exp(i*x(1))-exp(i*x(2)));
        df(2) = df(2) - 2*i*exp(i*x(2))*(2+2*i-exp(i*x(1))-exp(i*x(2)));
    end
end