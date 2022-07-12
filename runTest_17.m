clear;
x0 = [0.5; 1.5; -1; 0.01; 0.02];
H0 = eye(5);
tic;
[x_result, k] = CS_BFGS(@Osborne_1, x0, H0, 1e-7, 1000, 1e-6, true);
%[x_result, k] = BFGS(@Osborne_1, @D_Osborne_1, x0, H0, 1000, 1e-6, true);
timetaking = toc;

