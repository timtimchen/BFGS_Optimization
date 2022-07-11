function [df] = D_Powell_badly_scaled(x)
% This function performs the gradient of Powell badly scaled function. n=2, m=2.
    
    df = zeros(2, 1);
    df(1) = 2000*(1000*x(1)*x(2) - 1)*x(2) - 2*(exp(-x(1))+exp(-x(2))-1.0001)*exp(-x(1)); 
    df(2) = 2000*(1000*x(1)*x(2) - 1)*x(1) - 2*(exp(-x(1))+exp(-x(2))-1.0001)*exp(-x(2));
end