clear;
n = 10;
n1 = (1:n)' + 1;
h = 1 ./ n1;
t = (1:n)' .* h;
x0 = t .* (t-1);
H0 = eye(n);
tic;
%[y_result, x_result, k] = BFGS_AG_CS(@Discrete_boundary_value, x0, H0, 1e-6, 1000, 1e-6, true);
[y_result, x_result, k] = BFGS(@Discrete_boundary_value, @D_Discrete_boundary_value, x0, H0, 1000, 1e-6, true);
timetaking = toc;
