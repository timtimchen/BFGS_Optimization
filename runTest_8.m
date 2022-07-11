clear;
x0 = [1; 1; 1];
H0 = eye(3);
tic;
%[x_result, k] = CS_BFGS(@Bard, x0, H0, 1000, 1e-9, true);
[x_result, k] = BFGS(@Bard, @D_Bard, x0, H0, 1000, 1e-9, true);
timetaking = toc;
