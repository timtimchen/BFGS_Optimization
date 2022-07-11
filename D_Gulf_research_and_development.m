function [df] = D_Gulf_research_and_development(x)
% This function performs the gradient of Gulf research and development function. n = 3, n <= m <= 100.  

    m = 10; % m can be any number between n and 100
    t = (1:m)/100;
    y = 25 + (-50 * log(t)).^(2/3);
    df = zeros(3, 1);
    x_y = x(2) - y;
    axy = abs(x_y);
    x_y_3 = axy.^x(3);
    e = exp(-x_y_3/x(1));
    f = e - t;
    ef = 2 .* e .* f .* x_y_3;

    df(1) = sum(ef / x(1)^2);
    df(2) = sum(ef * x(3) / (x(1) * x_y));
    df(3) = sum(ef .* log(axy) / x(1));
end