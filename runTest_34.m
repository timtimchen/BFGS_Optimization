clear;
n = 4;
x0 = ones(n, 1);
H0 = eye(n);
tic;
%[y_result, x_result, k] = CS_BFGS(@Linear_rank_1_with_0cr, x0, H0, 1e-6, 1000, 1e-6, true);
[y_result, x_result, k] = BFGS(@Linear_rank_1_with_0cr, @D_Linear_rank_1_with_0cr, x0, H0, 1000, 1e-6, true);
timetaking = toc;
