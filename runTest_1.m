clear;
x0 = [-1.2; 1.0];
H0 = eye(2);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Rosenbrock, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Rosenbrock, @D_Rosenbrock, x0, H0, 1000, 1e-12, true);
[y_result, x_result, k] = BFGS_AG_Oh(@Rosenbrock, x0, H0, 1e-9, 1000, 1e-6, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Rosenbrock, x0, H0, 1e-9, 10000, 1e-9, true);
timetaking = toc;
