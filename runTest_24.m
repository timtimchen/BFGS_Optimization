clear;
x0 = [0.5; 0.5; 0.5; 0.5];
H0 = eye(4);
%x0 = [0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5];
%H0 = eye(10);
tic;
[y_result, x_result, k] = CS_BFGS(@Penalty_II, x0, H0, 1e-6, 10000, 1e-6, true);
%[y_result, x_result, k] = BFGS(@Penalty_II, @D_Penalty_II, x0, H0, 10000, 1e-6, true);
timetaking = toc;
