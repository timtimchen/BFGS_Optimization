clear;
x0 = [3; -1; 0; 1; 3; -1; 0; 1; 3; -1; 0; 1];
H0 = eye(12);
tic;
[y_result, x_result, k] = BFGS_AG_CS(@Extended_Powell, x0, H0, 1e-6, 1000, 1e-6, true);
%[y_result, x_result, k] = BFGS(@Extended_Powell, @D_Extended_Powell, x0, H0, 1000, 1e-9, true);
timetaking = toc;
