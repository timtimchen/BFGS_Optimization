function [df] = D_Bard(x)
% This function performs the gradient of Bard function. n = 3, m = 15. 

    y = [0.14; 0.18; 0.22; 0.25; 0.29; 0.32; 0.35; 0.39; 0.37; 0.58; 0.73; 0.96; 1.34; 2.10; 4.39];
    df = zeros(3,1);
    for i = 1:15
        u = i;
        v = 16 - i;
        w = min(u, v);
        df(1) = df(1) - 2* (y(i) - (x(1)+u/(v*x(2)+w*x(3))));
        df(2) = df(2) + 2*(y(i) - (x(1)+u/(v*x(2)+w*x(3))))*u*v/(v*x(2)+w*x(3))^2;
        df(3) = df(3) + 2*(y(i) - (x(1)+u/(v*x(2)+w*x(3))))*u*w/(v*x(2)+w*x(3))^2;
    end
end