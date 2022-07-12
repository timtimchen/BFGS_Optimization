clear;
x0 = [1; 1];
H0 = eye(2);
tic;
%[x_result, k] = CS_BFGS(@Beale, x0, H0, 1e-6, 1000, 1e-6, true);
[x_result, k] = BFGS(@Beale, @D_Beale, x0, H0, 1000, 1e-6, true);
timetaking = toc;
