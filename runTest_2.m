clear;
x0 = [0.5; -2];
H0 = eye(2);
tic;
%[y_result, x_result, k] = CS_BFGS(@Freudenstein_and_Roth, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Freudenstein_and_Roth, @D_Freudenstein_and_Roth, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG1(@Freudenstein_and_Roth, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG2(@Freudenstein_and_Roth, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
