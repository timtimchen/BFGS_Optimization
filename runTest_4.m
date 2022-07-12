clear;
x0 = [1; 1];
H0 = eye(2);
tic;
%[x_result, k] = CS_BFGS(@Brown_badly_scaled, x0, H0, 1e-6, 1000, 1e-6, true);
[x_result, k] = BFGS(@Brown_badly_scaled, @D_Brown_badly_scaled, x0, H0, 1000, 1e-6, true);
timetaking = toc;
