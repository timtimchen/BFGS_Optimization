function [f] = Bard(x)
% Bard function. n = 3, m = 15. 
% x_0 = (1,1,1) The true minimum is f = 8.21487e-3.
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P22.

    y = [0.14; 0.18; 0.22; 0.25; 0.29; 0.32; 0.35; 0.39; 0.37; 0.58; 0.73; 0.96; 1.34; 2.10; 4.39];
    f = 0.0;
    for i = 1:15
        u = i;
        v = 16 - i;
        w = min(u, v);
        f = f + (y(i) - (x(1)+u/(v*x(2)+w*x(3))))^2;
    end

end