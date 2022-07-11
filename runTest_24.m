clear;
%x0 = [0.5; 0.5; 0.5; 0.5];
%H0 = eye(4);
x0 = [0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5];
H0 = eye(10);
tic;
%[x_result, k] = CS_BFGS(@Penalty_II, x0, H0, 10000, 1e-9, true);
[x_result, k] = BFGS(@Penalty_II, @D_Penalty_II, x0, H0, 10000, 1e-9, true);
timetaking = toc;
