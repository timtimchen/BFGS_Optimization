clear;
n = 4;
x0 = ones(n, 1);
H0 = eye(n);
tic;
[y_result, x_result, k] = CS_BFGS(@Linear_full_rank, x0, H0, 1e-6, 1000, 1e-6, true);
%[y_result, x_result, k] = BFGS(@Linear_full_rank, @D_Linear_full_rank, x0, H0, 1000, 1e-9, true);
timetaking = toc;
