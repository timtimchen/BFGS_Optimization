clear;
x0 = [0; 1];
H0 = eye(2);
tic;
%[x_result, k] = CS_BFGS(@Powell_badly_scaled, x0, H0, 1000, 1e-6, true);
[x_result, k] = BFGS(@Powell_badly_scaled, @D_Powell_badly_scaled, x0, H0, 1000, 1e-6, true);
timetaking = toc;
