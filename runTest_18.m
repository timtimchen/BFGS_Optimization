clear;
x0 = [1; 2; 1; 1; 1; 1];
H0 = eye(6);
tic;
[x_result, k] = CS_BFGS(@Biggs_EXP6, x0, H0, 1e-6, 100, 1e-6, true);
%[x_result, k] = BFGS(@Biggs_EXP6, @D_Biggs_EXP6, x0, H0, 1000, 1e-6, true);
timetaking = toc;
