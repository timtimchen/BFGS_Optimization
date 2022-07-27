clear;
x0 = [-1; 0; 0];
H0 = eye(3);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Helical_valley, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Helical_valley, @D_Helical_valley, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG_Oh(@Helical_valley, x0, H0, 1e-12, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Helical_valley, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
