function [f] = Meyer(x)
% Meyer function. n = 3, m = 16. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P23.

    y = [34780; 28610; 23650; 19630; 16370; 13720; 11540; 9744; 8261; 7030; 6005; 5147; 4427; 3820; 3307; 2872];
    f = 0.0;
    for i = 1:16
        t = 45 + 5*i;
        f = f + (x(1)*exp(x(2)/(t+x(3))) - y(i))^2;
    end

end