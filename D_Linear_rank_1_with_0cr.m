function [df] = D_Linear_rank_1_with_0cr(x)
% This function performs the gradient of Linear function - rank 1 with zero columns and rows. n is variable, m >= n. 
    
    n = length(x);
    m = max(n, 10);
    xjsum = (2:n-1) * x(2:n-1);
    df = zeros(n,1);
    for i = 2:m-1
		fi = (i-1) * xjsum - 1;
		df = df + 2.*fi.*(i-1).*(1:n)';
    end
    df(1) = 0;
    df(n) = 0;
end