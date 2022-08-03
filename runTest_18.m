%clear;
x0 = [1; 2; 1; 1; 1; 1];
H0 = eye(6);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Biggs_EXP6, x0, H0, 1e-9, 100, 1e-9, true);
[y_result, x_result, k] = BFGS(@Biggs_EXP6, @D_Biggs_EXP6, x0, H0, 1000, 1e-11, true);
%[y_result, x_result, k] = BFGS_AG_Oh(@Biggs_EXP6, x0, H0, 1e-12, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_CS(@Biggs_EXP6, x0, H0, 1e-9, 100, 1e-9, true);
timetaking = toc;
