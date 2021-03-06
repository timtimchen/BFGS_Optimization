clear;
x0 = [0; 1];
H0 = eye(2);
tic;
%[y_result, x_result, k] = CS_BFGS(@Powell_badly_scaled, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Powell_badly_scaled, @D_Powell_badly_scaled, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG1(@Powell_badly_scaled, x0, H0, 1e-15, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG2(@Powell_badly_scaled, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
