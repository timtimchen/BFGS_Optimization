maxIter = 10000; % max iteration number of each run, if the algorithm end at the max iteration it indicate the optimazation is not converged.
totalTest = 12; % total number of problems in the test set
trial = 20; % number of trials of each algorithm
topTrial = 5; % number of fasting trials of each algorithm, used to find average the running time
tol = 1e-6; % the convergence tolerance for the projected gradient
display = false; % whether print iterations details

% a list of function handles of Problems in the test set
func_handles = {@Rosenbrock;
    @Freudenstein_and_Roth;
    @Powell_badly_scaled;
    @Brown_badly_scaled;
    @Beale;
    @Helical_valley;
    @Bard;
    @Guassian;
    @Box_3D;
    @Powell_singular;
    @Wood;
    @Kowalik_and_Osborne;
    @Chebyquad};

% a list of gradient handles of Problems in the test set
grad_handles = {@D_Rosenbrock;
    @D_Freudenstein_and_Roth;
    @D_Powell_badly_scaled;
    @D_Brown_badly_scaled;
    @D_Beale;
    @D_Helical_valley;
    @D_Bard;
    @D_Guassian;
    @D_Box_3D;
    @D_Powell_singular;
    @D_Wood;
    @D_Kowalik_and_Osborne;
    @D_Chebyquad};

% initial start point of each problems in the test set
x35 = (1:8)'/(8+1);
inputs = {[-1.2; 1.0];
[0.5; -2];
[0; 1];
[1; 1];
[1; 1];
[-1; 0; 0];
[1; 1; 1];
[0.4; 1; 0];
[0; 10; 20];
[3; -1; 0; 1];
[-3; -1; -3; -1];
[0.25; 0.39; 0.415; 0.39];
x35};

% initial a table to store the running time result, rows for defferent
% problem test, column 1 for BFGS algorithm, column 2 for Complex-Step BFGS
% algorithm
timeResult = zeros(totalTest, 2);
iterationResult = zeros(totalTest, 2);
funcEvalResult = zeros(totalTest, 2);

% run each problem, optimizated it with BFGS and CS_BFGS separately
for tn = 1 : totalTest
    x0 = inputs{tn}; % get the initial start point
    n = length(x0); % get the dimension
    H0 = eye(n); % use idintity matrix as the initial Hessian

    % run BFGS algorithm on the test problem several times and record the
    % running time, total iterations, and total number of function evaluate
    timetaking = zeros(trial, 1);
    for trial_i = 1:trial
        tic;
        [x_result, k, funcEval] = BFGS(func_handles{tn}, grad_handles{tn}, x0, H0, maxIter, tol, display);
        timetaking(trial_i) = toc;
    end
    st = sort(timetaking); 
    % only average the time of top 5 runs
    timeResult(tn, 1) = sum(st(1:topTrial)) / topTrial; 
    iterationResult(tn, 1) = k; 
    funcEvalResult(tn, 1)= funcEval;

    % run CS_BFGS algorithm on the test problem several times and record the
    % running time, total iterations, and total number of function evaluate
    timetaking = zeros(trial, 1);
    for trial_i = 1:trial
        tic;
        [x_result, k, funcEval] = CS_BFGS(func_handles{tn}, x0, H0, maxIter, tol, display);
        timetaking(trial_i) = toc;
    end
    st = sort(timetaking);
    % only average the time of top 5 runs
    timeResult(tn, 2) = sum(st(1:topTrial)) / topTrial; 
    iterationResult(tn, 2) = k; 
    funcEvalResult(tn, 2)= funcEval;

end