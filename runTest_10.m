clear;
x0 = [0.02; 4000; 250];
%x0 = [0.1; 1000; 200];
H0 = eye(3);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Meyer, x0, H0, 1e-6, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS(@Meyer, @D_Meyer, x0, H0, 1000, 1e-6, true);
timetaking = toc;
