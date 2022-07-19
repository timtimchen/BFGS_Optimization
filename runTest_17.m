clear;
x0 = [0.5; 1.5; -1; 0.01; 0.02];
H0 = eye(5);
tic;
%y_result, x_result, k] = CS_BFGS(@Osborne_1, x0, H0, 1e-9, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS(@Osborne_1, @D_Osborne_1, x0, H0, 1000, 1e-9, true);
%[y_result, x_result, k] = CS_BFGS(@Osborne_1, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG2(@Osborne_1, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;

