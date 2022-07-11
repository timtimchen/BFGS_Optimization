function [f] = Linear_rank_1(x)
% Linear function - rank 1. n is variable, m >= n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P28.

    n = length(x);
	m = max(n, 10); % set m = 10, or m = n if n > 10

    f = 0; 
    xjsum = (1:n) * x;
    for i = 1:m
		fi = i * xjsum - 1;
		f = f + fi^2;
    end
end