function [f] = Helical_valley(x)
% Helical valley function. n = 3, m = 3. 
% x_0 = (-1,0,0) The true minimum is f = 0 at x = (1,0,0).
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P21.

    theda = 0.0;
    if x(1) > 0
        theda = atan(x(2)/x(1))/(2*pi);
    end
    if x(1) < 0
        theda = atan(x(2)/x(1))/(2*pi) + 0.5;
    end
    f = 100*(x(3) - 10*theda)^2 + 100*(sqrt(x(1)^2 + x(2)^2) - 1)^2 + x(3)^2;
end