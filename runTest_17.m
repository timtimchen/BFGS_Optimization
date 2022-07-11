clear;
x0 = [0.5; 1.5; -1; 0.01; 0.02];
H0 = eye(5);
tic;
[x_result, k] = CS_BFGS(@Osborne_1, x0, H0, 1000, 1e-9, true);
%[x_result, k] = BFGS(@Osborne_1, @D_Osborne_1, x0, H0, 1000, 1e-9, true);
timetaking = toc;


%
%iter: 154, f(x)= 0.0000546489, x=[0.375409 1.935747 -1.464586 0.012867 0.022123 ], g=[-0.000000 -0.000000 -0.000000 0.000007 -0.000003 ]