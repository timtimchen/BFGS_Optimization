f = @(x) transpose(x)*x;

df = @(x) 2.0 * x;


x0 = [1.0; 2.0; 3.0];
H0 = eye(3);
[x_result, k] = BFGS(f, df, x0, H0, 1000, 1e-6, true);