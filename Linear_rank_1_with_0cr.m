function [f] = Linear_rank_1_with_0cr(x)
% Linear function - rank 1 with zero columns and rows. n is variable, m >= n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P28.

    n = length(x);
	m = max(n, 10); % set m = 10, or m = n if n > 10

    f1 = -1;
    fm = -1;
    f = f1^2 + fm^2; 
    xjsum = (2:n-1) * x(2:n-1);
    for i = 2:m-1
		fi = (i-1) * xjsum - 1;
		f = f + fi^2;
    end
end