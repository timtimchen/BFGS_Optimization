function [df] = D_Extended_Rosenbrock(x)
% This function performs the gradient of Extended rosenbrock function
% dimension n must be even, depended on the input x, m = n. 
    
    k = round(length(x)/2);
    df = zeros(2*k, 1);
    for i = 1:k
        df(2*i-1) = -400*x(2*i-1)*(x(2*i) - x(2*i-1)^2) - 2*(1-x(2*i-1)); 
        df(2*i) = 200*(x(2*i) - x(2*i-1)^2);
    end
end