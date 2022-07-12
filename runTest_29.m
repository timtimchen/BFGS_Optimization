clear;
n = 10;
n1 = (1:n)' + 1;
h = 1 ./ n1;
t = (1:n)' .* h;
x0 = t .* (t-1);
H0 = eye(n);
tic;
%[x_result, k] = CS_BFGS(@Discrete_integral_value, x0, H0, 1e-6, 1000, 1e-9, true);
[x_result, k] = BFGS(@Discrete_integral_value, @D_Discrete_integral_value, x0, H0, 1000, 1e-9, true);
timetaking = toc;
