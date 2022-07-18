%clear;
%x0 = zeros(6,1);
%H0 = eye(6);
x0 = zeros(9,1);
H0 = eye(9);
tic;
%[y_result, x_result, k] = CS_BFGS(@Watson, x0, H0, 1e-6, 1000, 1e-6, true);
[y_result, x_result, k] = BFGS(@Watson, @D_Watson, x0, H0, 1000, 1e-6, true);
timetaking = toc;
