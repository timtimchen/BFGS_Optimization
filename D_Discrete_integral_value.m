function [df] = D_Discrete_integral_value(x)
% This function performs the gradient of Discrete integral value function.
% n is variable, depended on the input x, m = n. 
    
    n = length(x);
    n1 = (1:n)' + 1;
    h = 1 ./ n1;
    t = (1:n)' .* h;

    df = zeros(n,1);
 
    for i = 1:n
		xtsum = 0;
		dfi = zeros(n, 1);
		for j = 1:n
			if j <= i 
				xtsum = xtsum + (1-t(i))*t(j)*(x(j)+t(j)+1)^3;
				dfi(j) = dfi(j) + h(i)*3*(1-t(i))*t(j)*(x(j)+t(j)+1)^2/2;
			else
				xtsum = xtsum + t(i)*(1-t(j))*(x(j)+t(j)+1)^3;
				dfi(j) = dfi(j) + h(i)*3*t(i)*(1-t(j))*(x(j)+t(j)+1)^2/2;
			end
		end
        fi = x(i) + h(i) * (xtsum)/ 2;
		
        dfi(i) = dfi(i) + 1;
		df = df + 2 .* fi .* dfi;
    end

end