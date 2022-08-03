clear;
x0 = [0.25; 0.39; 0.415; 0.39];
H0 = eye(4);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Kowalik_and_Osborne, x0, H0, 1e-9, 1000, 1e-9, true);
[y_result, x_result, k] = BFGS(@Kowalik_and_Osborne, @D_Kowalik_and_Osborne, x0, H0, 100, 1e-12, true);
%[y_result, x_result, k] = BFGS_AG_Oh(@Kowalik_and_Osborne, x0, H0, 1e-12, 1000, 1e-9, true);
%[y_result, x_result, k] = BFGS_AG_Oh2(@Kowalik_and_Osborne, x0, H0, 1e-9, 1000, 1e-9, true);
timetaking = toc;
