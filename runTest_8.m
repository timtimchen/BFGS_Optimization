clear;
x0 = [1; 1; 1];
H0 = eye(3);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Bard, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Bard, @D_Bard, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG_CS(@Bard, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Bard, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
