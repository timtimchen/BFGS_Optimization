clear;
x0 = [5; 2.5; 0.15];
H0 = eye(3);
tic;
[y_result, x_result, k] = CS_BFGS(@Gulf_research_and_development, x0, H0, 1e-6, 1000, 1e-6, true);
%[y_result, x_result, k] = BFGS(@Gulf_research_and_development, @D_Gulf_research_and_development, x0, H0, 1000, 1e-6, true);
timetaking = toc;
