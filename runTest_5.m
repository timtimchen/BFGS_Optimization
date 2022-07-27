clear;
x0 = [1; 1];
H0 = eye(2);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Beale, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Beale, @D_Beale, x0, H0, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_Oh(@Beale, x0, H0, 1e-9, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG_Oh2(@Beale, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
