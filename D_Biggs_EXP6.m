function [df] = D_Biggs_EXP6(x)
% This function performs the gradient of Biggs_EXP6 function. n = 6, m = 13. 

    m = 13;
    t = 0.1 .* (1:m)';
    y = exp(-t) - 5.*exp(-10.*t) + 3.*exp(-4.*t);
    f_i = x(3).*exp(-t.*x(1)) - x(4).*exp(-t.*x(2)) + x(6).*exp(-t.*x(5)) - y;
    df = zeros(6, 1);
    
    df(1) = sum(-2 .* t .* f_i .* x(3) .* exp(-t.*x(1)));
    df(2) = sum(2 .* t .* f_i .* x(4) .* exp(-t.*x(2)));
    df(3) = sum(2 .* f_i .* exp(-t.*x(1)));
    df(4) = sum(-2 .* f_i .* exp(-t.*x(2)));
    df(5) = sum(-2 .* t .* f_i .* x(6) .* exp(-t.*x(5)));
    df(6) = sum(2 .* f_i .* exp(-t.*x(5)));
end