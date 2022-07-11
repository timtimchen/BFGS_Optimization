function [df] = D_Rosenbrock(x)
% This function performs the gradient of rosenbrock function [f(x) = 100*(x(2) - x(1)^2)^2 + (1-x(1))^2] at x. 
% where dimension n = 2. 
    
    df = zeros(2, 1);
    df(1) = -400*x(1)*(x(2) - x(1)^2) - 2*(1-x(1)); 
    df(2) = 200*(x(2) - x(1)^2);
end