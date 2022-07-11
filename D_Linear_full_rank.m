function [df] = D_Linear_full_rank(x)
% This function performs the gradient of Linear function - full rank. n is variable, m >= n. 
    
    n = length(x);
    m = max(n, 10);
	xsum = sum(x);
    df = zeros(n,1);
    for i = 1:m
        if i <= n
        	fi = x(i) - 2*xsum/m - 1;
		else
        	fi = - 2*xsum/m - 1;
        end
        for j = 1:n
            if j == i && i <= n
                df(j) = df(j) + 2*fi*(1 - 2/m);
            else
                df(j) = df(j) - 4*fi/m;
            end
        end
    end

end