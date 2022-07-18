clear;
x0 = [0; 10; 20];
H0 = eye(3);
tic;
[y_result, x_result, k] = CS_BFGS(@Box_3D, x0, H0, 1e-6, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Box_3D, @D_Box_3D, x0, H0, 1000, 1e-9, true);
timetaking = toc;
