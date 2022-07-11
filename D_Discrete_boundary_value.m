function [df] = D_Discrete_boundary_value(x)
% This function performs the gradient of Discrete boundary value function.
% n is variable, depended on the input x, m = n. 
    
    n = length(x);
    n1 = (1:n)' + 1;
    h = 1 ./ n1;
    t = (1:n)' .* h;

    df = zeros(n,1);
    f1 = 2*x(1) - x(2) + h(1)^2 * (x(1) + t(1) + 1)^3 / 2;
    df(1) = df(1) + 2*f1*(2 + 3*h(1)^2*(x(1) + t(1) + 1)^2/2);
    df(2) = df(2) - 2*f1;
    for i = 2:n-1
        fi = 2*x(i) - x(i-1) - x(i+1) + h(i)^2 * (x(i) + t(i) + 1)^3 / 2;
        df(i) = df(i) + 2*fi*(2 + 3*h(i)^2*(x(i) + t(i) + 1)^2/2);
        df(i-1) = df(i-1) - 2*fi;
        df(i+1) = df(i+1) - 2*fi;
    end
    fn = 2*x(n) - x(n-1) + h(i)^2 * (x(i) + t(i) + 1)^3 / 2;
    df(n) = df(n) + 2*fn*(2 + 3*h(n)^2*(x(n) + t(n) + 1)^2/2);
    df(n-1) = df(n-1) - 2*fn;
end