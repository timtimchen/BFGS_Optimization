f = @(x) transpose(x) * x;

x0 = [1.0; 2.0; 3.0];
H0 = eye(3);
[y_result, x_result, k] = CS_BFGS(f, x0, H0, 1e-6, 1000, 1e-6, true);