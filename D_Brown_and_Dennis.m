function [df] = D_Brown_and_Dennis(x)
% This function performs the gradient of Brown and Dennis function. n = 4, m >= n.

    df = zeros(4, 1);
    m = 20;
    for i = 1:m
        t = i / 5;
        df(1) = df(1) + 4*((x(1)+t*x(2)-exp(t))^2 +(x(3)+x(4)*sin(t)-cos(t))^2)*(x(1)+t*x(2)-exp(t));
        df(2) = df(2) + 4*t*((x(1)+t*x(2)-exp(t))^2 +(x(3)+x(4)*sin(t)-cos(t))^2)*(x(1)+t*x(2)-exp(t));
        df(3) = df(3) + 4*((x(1)+t*x(2)-exp(t))^2 +(x(3)+x(4)*sin(t)-cos(t))^2)*(x(3)+x(4)*sin(t)-cos(t));
        df(4) = df(4) + 4*sin(t)*((x(1)+t*x(2)-exp(t))^2 +(x(3)+x(4)*sin(t)-cos(t))^2)*(x(3)+x(4)*sin(t)-cos(t));
    end
end