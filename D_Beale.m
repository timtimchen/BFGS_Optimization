function [df] = D_Beale(x)
% This function performs the gradient of Brown badly scaled function. n=2, m=2.

    y = [1.5; 2.25; 2.635];
    df = zeros(2,1);
    for i = 1:3
        df(1) = df(1) - 2*(y(i) - x(1)*(1 - x(2)^i))*(1 - x(2)^i);
        df(2) = df(2) + 2*i*(y(i) - x(1)*(1 - x(2)^i))*x(1)*x(2)^(i-1);
    end
end