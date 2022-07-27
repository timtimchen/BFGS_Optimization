clear;
x0 = [-3; -1; -3; -1];
H0 = eye(4);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Wood, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Wood, @D_Wood, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG_Oh(@Wood, x0, H0, 1e-12, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Wood, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
