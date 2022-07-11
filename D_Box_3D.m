function [df] = D_Box_3D(x)
% This function performs the gradient of Box three-dimensional function. n = 3, m >= n.

    m = 10;
    df = zeros(3,1);
    for i = 1:m
        t = 0.1 * i;
        df(1) = df(1) - 2*t*exp(-t*x(1))*(exp(-t*x(1)) - exp(-t*x(2)) - x(3)*(exp(-t) -exp(-10*t)));
        df(2) = df(2) + 2*t*exp(-t*x(2))*(exp(-t*x(1)) - exp(-t*x(2)) - x(3)*(exp(-t) -exp(-10*t)));
        df(3) = df(3) - 2*(exp(-t) -exp(-10*t))*(exp(-t*x(1)) - exp(-t*x(2)) - x(3)*(exp(-t) -exp(-10*t)));
    end
end