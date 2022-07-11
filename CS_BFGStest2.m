f = @(x) exp(-(transpose(x)*x));

x0 = [-0.1; -0.2; -0.3];
H0 = eye(3);
[x_result, k] = CS_BFGS(f, x0, H0, 1000, 0, true);