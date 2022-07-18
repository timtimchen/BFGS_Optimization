clear;
n = 12;
x0 = ones(n, 1) .* (-0.5);
H0 = eye(n);
tic;
[y_result, x_result, k] = CS_BFGS(@Broyden_tridiagonal, x0, H0, 1e-6, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Broyden_tridiagonal, @D_Broyden_tridiagonal, x0, H0, 100, 1e-9, true);
timetaking = toc;
