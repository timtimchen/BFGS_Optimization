clear;
% define 4 test fucntions
f1 = @(x) x'*x; d1 = 1;
f2 = @(x) sum(x.^2); d2 = 10;
f3 = @(x) exp(x); d3=1;
f4 = @(x) 100*(x(2) - x(1)^2)^2 + (1-x(1))^2; d4 = 2;

% run trials = 10^j

j=7;

% set 2 timers for each function
t1_r = 0; 
t1_c = 0;
t2_r = 0; 
t2_c = 0;
t3_r = 0; 
t3_c = 0;
t4_r = 0; 
t4_c = 0;

% evaluate 10^j times of each functions and accumulate the run-time
for k=1:10^j
    % evaluate function 1 of real value 
    x1 = rand(1,d1);
    tic
    f1(x1);
    t1_r = t1_r + toc;
    % evaluate function 1 of complex value 
    z1 = rand(1,d1)+ 1i*rand(1,d1);
    tic
    f1(z1);
    t1_c = t1_c + toc;

    % evaluate function 2 of real value 
    x2 = rand(1,d2);
    tic
    f2(x2);
    t2_r = t2_r + toc;
    % evaluate function 2 of complex value 
    z2 = rand(1,d2)+ 1i*rand(1,d2);
    tic
    f2(z2);
    t2_c = t2_c + toc;

    % evaluate function 3 of real value 
    x3 = rand(1,d3);
    tic
    f3(x3);
    t3_r = t3_r + toc;
    % evaluate function 3 of complex value 
    z3 = rand(1,d3)+ 1i*rand(1,d3);
    tic
    f3(z3);
    t3_c = t3_c + toc;

    % evaluate function 4 of real value 
    x4 = rand(1,d4);
    tic
    f4(x4);
    t4_r = t4_r + toc;
    % evaluate function 4 of complex value 
    z4 = rand(1,d4)+ 1i*rand(1,d4);
    tic
    f4(z4);
    t4_c = t4_c + toc;


end

fprintf('t1_r = %f, t1_c = %f \n', t1_r, t1_c);
fprintf('t2_r = %f, t2_c = %f \n', t2_r, t2_c);
fprintf('t3_r = %f, t3_c = %f \n', t3_r, t3_c);
fprintf('t4_r = %f, t4_c = %f \n', t4_r, t4_c);
