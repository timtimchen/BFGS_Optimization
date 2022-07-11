clear;
n = 4;
x0 = ones(n, 1) .* (-1);
H0 = eye(n);
tic;
%[x_result, k] = CS_BFGS(@Broyden_banded, x0, H0, 1000, 1e-9, true);
[x_result, k] = BFGS(@Broyden_banded, @D_Broyden_banded, x0, H0, 1000, 1e-9, true);
timetaking = toc;
