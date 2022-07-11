clear;
x0 = [-1.2; 1.0];
H0 = eye(2);
tic;
%[x_result, k] = CS_BFGS(@rosenbrock, x0, H0, 1000, 1e-6, true);
[x_result, k] = BFGS(@rosenbrock, @D_rosenbrock, x0, H0, 1000, 1e-6, true);
timetaking = toc;
