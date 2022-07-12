clear;
x0 = [0.75; 0.5; 0.25; 0];
H0 = eye(4);
tic;
%[x_result, k] = CS_BFGS(@Variable_dimensioned, x0, H0, 1e-6, 1000, 1e-9, true);
[x_result, k] = BFGS(@Variable_dimensioned, @D_Variable_dimensioned, x0, H0, 1000, 1e-9, true);
timetaking = toc;
