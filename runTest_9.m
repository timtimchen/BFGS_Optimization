clear;
x0 = [0.4; 1; 0];
H0 = eye(3);
tic;
%[y_result, x_result, k] = CS_BFGS(@Guassian, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Guassian, @D_Guassian, x0, H0, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG1(@Guassian, x0, H0, 1e-9, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG2(@Guassian, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
