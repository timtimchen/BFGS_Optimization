clear;
x0 = [25; 5; -5; -1];
H0 = eye(4);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Brown_and_Dennis, x0, H0, 1e-6, 100, 1e-5, true);
[y_result, x_result, k] = BFGS(@Brown_and_Dennis, @D_Brown_and_Dennis, x0, H0, 100, 1e-6, true);
timetaking = toc;
