function [df] = D_Broyden_tridiagonal(x)
% This function performs the gradient of Broyden tridiagonal function.
% n is variable, depended on the input x, m = n. 
    
    n = length(x);

    df = zeros(n,1);
    f1 = 3*x(1) - 2*x(1)^2 - 2*x(2) + 1;
    df(1) = df(1) + 2*f1*(3 - 4*x(1));
    df(2) = df(2) - 4*f1;
    for i = 2:n-1
        fi = 3*x(i) - 2*x(i)^2 - x(i-1) - 2*x(i+1) + 1;
        df(i) = df(i) + 2*fi*(3 - 4*x(i));
        df(i+1) = df(i+1) - 4*fi;
        df(i-1) = df(i-1) - 2*fi;
    end
    fn = 3*x(n) - 2*x(n)^2 - x(n-1) + 1;
    df(n) = df(n) + 2*fn*(3 - 4*x(n));
	df(n-1) = df(n-1) - 2*fn;

end