
clear;
x0 = [1.3; 0.65; 0.65; 0.7; 0.6; 3; 5; 7; 2; 4.5; 5.5];
H0 = eye(11);
tic;
[y_result, x_result, k] = BFGS_AG_CS(@Osborne_2, x0, H0, 1e-6, 1000, 1e-6, true);
%[y_result, x_result, k] = BFGS(@Osborne_2, @D_Osborne_2, x0, H0, 1000, 1e-6, true);
timetaking = toc;
