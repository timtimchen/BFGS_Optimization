clear;
x0 = [-1.2, 1, -1.2, 1, -1.2, 1, -1.2, 1];
H0 = eye(8);
tic;
[x_result, k] = CS_BFGS(@Extended_Rosenbrock, x0, H0, 100, 1e-9, true);
%[x_result, k] = BFGS(@Extended_Rosenbrock, @D_Extended_Rosenbrock, x0, H0, 100, 1e-9, true);
timetaking = toc;
