function [f] = Discrete_integral_value(x)
% Discrete integral value function. n is variable, depended on the input x, m = n. 
%
% reference: J.J. More and S.M. Wild. Benchmarking derivative-freeoptimization algorithms. P27.

    n = length(x);
    n1 = (1:n)' + 1;
    h = 1 ./ n1;
    t = (1:n)' .* h;

    f = 0;
    for i = 1:n
		xtsum = 0;
		for j = 1:n
			if j <= i 
				xtsum = xtsum + (1-t(i))*t(j)*(x(j)+t(j)+1)^3;
			else
				xtsum = xtsum + t(i)*(1-t(j))*(x(j)+t(j)+1)^3;
			end
		end
        fi = x(i) + h(i) * (xtsum)/ 2;
        f = f + fi^2;
    end

end