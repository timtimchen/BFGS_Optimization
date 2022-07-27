clear;
x0 = [0.2; 0.2; 0.2; 0.2; 0.2];
H0 = eye(5);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Trigonnometric, x0, H0, 1e-6, 1000, 1e-6, true);
[y_result, x_result, k] = BFGS(@Trigonnometric, @D_Trigonnometric, x0, H0, 1000, 1e-6, true);
timetaking = toc;
