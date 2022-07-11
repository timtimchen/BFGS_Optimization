clear;
x0 = [25; 5; -5; -1];
H0 = eye(4);
tic;
[x_result, k] = CS_BFGS(@Brown_and_Dennis, x0, H0, 1000, 1e-9, true);
%[x_result, k] = BFGS(@Brown_and_Dennis, @D_Brown_and_Dennis, x0, H0, 100, 1e-6, true);
timetaking = toc;
