clear;
x0 = [0; 10; 20];
H0 = eye(3);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Box_3D, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS(@Box_3D, @D_Box_3D, x0, H0, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS_AG_Oh(@Box_3D, x0, H0, 1e-9, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Box_3D, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
