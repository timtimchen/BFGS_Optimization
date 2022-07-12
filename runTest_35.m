clear;
n = 10;
x0 = (1:n)'/(n+1);
H0 = eye(n);
tic;
[x_result, k] = CS_BFGS(@Chebyquad, x0, H0, 1e-6, 1000, 1e-6, true);
%[x_result, k] = BFGS(@Chebyquad, @D_Chebyquad, x0, H0, 1000, 1e-6, true);
timetaking = toc;
