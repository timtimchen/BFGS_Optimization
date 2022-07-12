clear;
x0 = [0.4; 1; 0];
H0 = eye(3);
tic;
%[x_result, k] = CS_BFGS(@Guassian, x0, H0, 1e-6, 1000, 1e-9, true);
[x_result, k] = BFGS(@Guassian, @D_Guassian, x0, H0, 1000, 1e-9, true);
timetaking = toc;
