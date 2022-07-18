clear;
%x0 = [0.3; 0.4];
x0 = [0.2; 0.2];
%H0 = eye(2) * 1e-5;
H0 = eye(2);
tic;
%[y_result, x_result, k] = CS_BFGS(@Jennrich_and_Sampson, x0, H0, 1e-6, 100, 1e-9, true);
[y_result, x_result, k] = BFGS(@Jennrich_and_Sampson, @D_Jennrich_and_Sampson, x0, H0, 100, 1e-6, true);
timetaking = toc;
