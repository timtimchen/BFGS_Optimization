function [f] = Broyden_banded(x)
% Broyden banded function. n is variable, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P28.

    n = length(x);
	ml = 5;
	mu = 1;
    f = 0;
    
    for i = 1:n
        xsum = 0;
		for j = 1:n
            if (j ~= i && j >= max(1, i-ml) && j <= min(n, i+mu))
				xsum = xsum + x(j)*(1+x(j));
            end
		end
        fi = 2*x(i) + 5*x(i)^3 + 1 - xsum;
        f = f + fi^2;
    end
end