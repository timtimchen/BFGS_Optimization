function [df] = D_Broyden_banded(x)
% This function performs the gradient of Broyden banded function.
% n is variable, depended on the input x, m = n. 
    
    n = length(x);
	ml = 5;
	mu = 1;
    df = zeros(n,1);
 
    for i = 1:n
		xsum = 0;
		dfi = zeros(n, 1);
		for j = 1:n
            if (j ~= i && j >= max(1, i-ml) && j <= min(n, i+mu))
				xsum = xsum + x(j)*(1+x(j));
                dfi(j) = dfi(j) - (1 + 2*x(j));
            end
		end
        fi = 2*x(i) + 5*x(i)^3 + 1 - xsum;
		
        dfi(i) = dfi(i) + 2 + 15*x(i)^2;
		df = df + 2 .* fi .* dfi;
    end

end