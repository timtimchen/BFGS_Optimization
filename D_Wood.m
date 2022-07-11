function [df] = D_Wood(x)
% This function performs the gradient of Wood function. n = 4, m = 6.

    df = zeros(4,1);
    df(1) = -400*x(1)*(x(2)-x(1)^2) - 2*(1-x(1));
    df(2) = 200*(x(2)-x(1)^2) + 20*(x(2)+x(4)-2) + (x(2)-x(4))/5;
    df(3) = -360*x(3)*(x(4)-x(3)^2) - 2*(1-x(3));
    df(4) = 180*(x(4)-x(3)^2) + 20*(x(2)+x(4)-2) - (x(2)-x(4))/5;
end