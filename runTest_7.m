clear;
x0 = [-1; 0; 0];
H0 = eye(3);
tic;
[x_result, k] = CS_BFGS(@Helical_valley, x0, H0, 1000, 1e-6, true);
%[x_result, k] = BFGS(@Helical_valley, @D_Helical_valley, x0, H0, 1000, 1e-6, true);
timetaking = toc;
