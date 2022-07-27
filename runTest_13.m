clear;
x0 = [3; -1; 0; 1];
H0 = eye(4);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Powell_singular, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Powell_singular, @D_Powell_singular, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG_Oh(@Powell_singular, x0, H0, 1e-12, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Powell_singular, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
