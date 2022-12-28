%clear;
x0 = [0.5; 1.5; -1; 0.01; 0.02];
H0 = eye(5);
tic;
[y_result, x_result, k] = BFGS_AG_CS(@Osborne_1, x0, H0, 1e-15, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Osborne_1, @D_Osborne_1, x0, H0, 1000, 1e-3, true);
%[y_result, x_result, k] = BFGS_AG_Oh(@Osborne_1, x0, H0, 1e-3, 1000, 1e-3, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Osborne_1, x0, H0, 1e-3, 1000, 1e-3, true);
timetaking = toc;

