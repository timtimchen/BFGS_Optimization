function [f] = Linear_full_rank(x)
% Linear function - full rank. n is variable, m >= n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P28.

    n = length(x);
	m = max(n, 10); % set m = 10, or m = n if n > 10

    f = 0; 
    xsum = sum(x);
    for i = 1:m
		if i <= n
        	fi = x(i) - 2*xsum/m - 1;
		else
        	fi = - 2*xsum/m - 1;
		end
        f = f + fi^2;
    end
end