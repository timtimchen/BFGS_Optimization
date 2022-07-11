function [f] = Gulf_research_and_development(x)
% Gulf research and development function. n = 3, n <= m <= 100. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P23.

    m = 10; % m can be any number between n and 100
    t = (1:m)'/100;
    y = 25 + (-50 * log(t)).^(2/3);
    f_i = exp(-(norm(y - x(2)) .^x(3) / x(1))) - t;
    f = sum(f_i .^ 2);

end