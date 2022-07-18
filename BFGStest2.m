f = @(x) exp(-(transpose(x)*x));

df = @(x) -2*exp(-(transpose(x)*x))*x;


x0 = [-0.1; -0.2; -0.3];
H0 = eye(3);
[y_result, x_result, k] = BFGS(f, df, x0, H0, 1000, 1e-6, true);