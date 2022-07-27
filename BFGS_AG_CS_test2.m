f = @(x) exp(-(transpose(x)*x));

x0 = [-0.1; -0.2; -0.3];
H0 = eye(3);
[y_result, x_result, k] = BFGS_AG_CS(f, x0, H0, 1e-6, 1000, 0, true);