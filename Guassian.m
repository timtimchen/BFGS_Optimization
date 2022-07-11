function [f] = Guassian(x)
% Bard function. n = 3, m = 15. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P22.

    y = [0.0009; 0.0044; 0.0175; 0.054; 0.1295; 0.242; 0.3521; 0.3989; 0.3521; 0.242; 0.1295; 0.054; 0.0175; 0.0044; 0.0009];
    f = 0.0;
    for i = 1:15
        t = (8-i)/2;
        f = f + (x(1)*exp(-x(2)*(t-x(3))^2 / 2) - y(i))^2;
    end

end