clear;
n = 8;
x0 = (1:n)'/(n+1);
H0 = eye(n);
tic;
%[x_result, k] = CS_BFGS(@Chebyquad, x0, H0, 1000, 1e-9, true);
[x_result, k] = BFGS(@Chebyquad, @D_Chebyquad, x0, H0, 1000, 1e-9, true);
timetaking = toc;
