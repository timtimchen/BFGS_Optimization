function [df] = D_Guassian(x)
% This function performs the gradient of Guassion function. n = 3, m = 15. 

    y = [0.0009; 0.0044; 0.0175; 0.054; 0.1295; 0.242; 0.3521; 0.3989; 0.3521; 0.242; 0.1295; 0.054; 0.0175; 0.0044; 0.0009];
    df = zeros(3,1);
    for i = 1:15
        t = (8-i)/2;
        df(1) = df(1) + 2*(x(1)*exp(-x(2)*(t-x(3))^2 / 2) - y(i))*exp(-x(2)*(t-x(3))^2 / 2);
        df(2) = df(2) - x(1)*(x(1)*exp(-x(2)*(t-x(3))^2 / 2) - y(i))*exp(-x(2)*(t-x(3))^2 / 2)*(t-x(3))^2;
        df(3) = df(3) + 2*x(1)*x(2)*(x(1)*exp(-x(2)*(t-x(3))^2 / 2) - y(i))*exp(-x(2)*(t-x(3))^2 / 2)*(t-x(3));
    end
end