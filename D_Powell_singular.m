function [df] = D_Powell_singular(x)
% This function performs the gradient of Powell singular function. n = 4, m = 4.

    df = zeros(4,1);
    df(1) = 2*(x(1)+10*x(2))+ 40*(x(1)-x(4))^3;
    df(2) = 20*(x(1)+10*x(2))+ 4*(x(2)-2*x(3))^3;
    df(3) = 10*(x(3)-x(4)) - 8*(x(2)-2*x(3))^3;
    df(4) = -10*(x(3)-x(4)) - 40*(x(1)-x(4))^3;
end