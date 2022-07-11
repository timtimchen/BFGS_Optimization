clear;
x0 = [-3; -1; -3; -1];
H0 = eye(4);
tic;
%[x_result, k] = CS_BFGS(@Wood, x0, H0, 1000, 1e-9, true);
[x_result, k] = BFGS(@Wood, @D_Wood, x0, H0, 1000, 1e-9, true);
timetaking = toc;
