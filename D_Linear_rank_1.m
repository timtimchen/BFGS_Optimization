function [df] = D_Linear_rank_1(x)
% This function performs the gradient of Linear function - rank 1. n is variable, m >= n. 
    
    n = length(x);
    m = max(n, 10);
    xjsum = (1:n) * x;
    df = zeros(n,1);
    for i = 1:m
		fi = i * xjsum - 1;
		df = df + 2.*fi.*i.*(1:n)';
    end

end