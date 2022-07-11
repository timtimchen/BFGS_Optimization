clear;
x0 = [0.5; 0.5; 0.5; 0.5];
H0 = eye(4);
tic;
%[x_result, k] = CS_BFGS(@Brown_almost_linear, x0, H0, 1000, 1e-9, true);
[x_result, k] = BFGS(@Brown_almost_linear, @D_Brown_almost_linear, x0, H0, 1000, 1e-9, true);
timetaking = toc;
