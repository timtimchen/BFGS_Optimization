clear;
x0 = [0.2; 0.2; 0.2; 0.2; 0.2];
H0 = eye(5);
tic;
%[x_result, k] = CS_BFGS(@Trigonnometric, x0, H0, 1e-6, 1000, 1e-6, true);
[x_result, k] = BFGS(@Trigonnometric, @D_Trigonnometric, x0, H0, 1000, 1e-6, true);
timetaking = toc;
