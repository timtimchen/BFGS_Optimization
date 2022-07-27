clear;
n = 6;
x0 = ones(n, 1) .* (-1);
H0 = eye(n);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Broyden_banded, x0, H0, 1e-6, 1000, 1e-6, true);
[y_result, x_result, k] = BFGS(@Broyden_banded, @D_Broyden_banded, x0, H0, 1000, 1e-6, true);
timetaking = toc;
