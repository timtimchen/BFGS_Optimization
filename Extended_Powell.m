function [f] = Extended_Powell(x)
% Extended Powell function. 
% dimension n must be a multiple of 4, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P26.
    k = round(length(x)/4);
    f = 0;
    for i = 1:k
        f = f + (x(4*i-3)+10*x(4*i-2))^2 + 5*(x(4*i-1)-x(4*i))^2 + (x(4*i-2)-2*x(4*i-1))^4 + 10*(x(4*i-3)-x(4*i))^4;
    end
end