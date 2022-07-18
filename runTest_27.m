clear;
x0 = [0.5; 0.5; 0.5; 0.5];
H0 = eye(4);
tic;
%[y_result, x_result, k] = CS_BFGS(@Brown_almost_linear, x0, H0, 1e-6, 1000, 1e-6, true);
[y_result, x_result, k] = BFGS(@Brown_almost_linear, @D_Brown_almost_linear, x0, H0, 1000, 1e-6, true);
timetaking = toc;
