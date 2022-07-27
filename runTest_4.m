clear;
x0 = [1; 1];
H0 = eye(2);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Brown_badly_scaled, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Brown_badly_scaled, @D_Brown_badly_scaled, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG_Oh(@Brown_badly_scaled, x0, H0, 1e-6, 1000, 1e-3, true);
%[y_result, x_result, k] = BFGS_AG_CS(@Brown_badly_scaled, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
