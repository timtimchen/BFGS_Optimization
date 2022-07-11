clear;
x0 = [0.5; -2];
H0 = eye(2);
tic;
%[x_result, k] = CS_BFGS(@Freudenstein_and_Roth, x0, H0, 1000, 1e-6, true);
[x_result, k] = BFGS(@Freudenstein_and_Roth, @D_Freudenstein_and_Roth, x0, H0, 1000, 1e-6, true);
timetaking = toc;
