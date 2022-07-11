clear;
x0 = [-1.2; 1.0];
H0 = eye(2);
tic;
%[x_result, k] = CS_BFGS(@Rosenbrock, x0, H0, 1000, 1e-6, true);
[x_result, k] = BFGS(@Rosenbrock, @D_Rosenbrock, x0, H0, 1000, 1e-6, true);
timetaking = toc;
