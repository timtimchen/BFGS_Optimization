clear;
maxIter = 10000; % max iteration number of each run, if the algorithm end at the max iteration it indicate the optimazation is not converged.
totalTest = 31; % total number of problems in the test set
trial = 20; % number of trials of each algorithm
topTrial = 5; % number of fasting trials of each algorithm, used to find average the running time
tol = 1e-6; % the convergence tolerance for the projected gradient
h = 1e-6; % the convergence tolerance for the projected gradient
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
    @Biggs_EXP6;
    @Osborne_2;
    @Watson;
    @Watson;
    @Extended_Rosenbrock;
    @Extended_Powell;
    @Penalty_II;
    @Penalty_II;
    @Variable_dimensioned;
    @Trigonnometric;
    @Brown_almost_linear;
    @Discrete_boundary_value;
    @Discrete_integral_value;
    @Broyden_banded;
    @Linear_full_rank;
    @Linear_rank_1;
    @Linear_rank_1_with_0cr;
    @Chebyquad;
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
    @D_Biggs_EXP6;
    @D_Osborne_2;
    @D_Watson;
    @D_Watson;
    @D_Extended_Rosenbrock;
    @D_Extended_Powell;
    @D_Penalty_II;
    @D_Penalty_II;
    @D_Variable_dimensioned;
    @D_Trigonnometric;
    @D_Brown_almost_linear;
    @D_Discrete_boundary_value;
    @D_Discrete_integral_value;
    @D_Broyden_banded;
    @D_Linear_full_rank;
    @D_Linear_rank_1;
    @D_Linear_rank_1_with_0cr;
    @D_Chebyquad;
    @D_Chebyquad};

% initial start point of each problems in the test set
n28 = (1:10)' + 1;
h28 = 1 ./ n28;
t28 = (1:10)' .* h28;
x28 = t28 .* (t28-1);

initPoints = {[-1.2; 1.0];
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
[1; 2; 1; 1; 1; 1];
[1.3; 0.65; 0.65; 0.7; 0.6; 3; 5; 7; 2; 4.5; 5.5];
zeros(6,1);
zeros(9,1);
[-1.2, 1, -1.2, 1, -1.2, 1, -1.2, 1];
[3; -1; 0; 1; 3; -1; 0; 1; 3; -1; 0; 1];
[0.5; 0.5; 0.5; 0.5];
[0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5; 0.5];
[0.75; 0.5; 0.25; 0];
[0.2; 0.2; 0.2; 0.2; 0.2];
[0.5; 0.5; 0.5; 0.5];
x28;
x28;
[-1; -1; -1; -1];
[1; 1; 1; 1];
[1; 1; 1; 1];
[1; 1; 1; 1];
(1:8)'/(8+1);
(1:10)'/(10+1)};

% initial a table to store the running time result, rows for defferent
% problem test, column 1 for BFGS algorithm, column 2 for Complex-Step BFGS
% algorithm
timeResult = zeros(totalTest, 2);
iterationResult = zeros(totalTest, 2);
funcEvalResult = zeros(totalTest, 2);
timeRatio = zeros(totalTest, 2);
funcEvalRatio = zeros(totalTest, 2);

% run each problem, optimizated it with BFGS and CS_BFGS separately
for tn = 1 : totalTest
    x0 = initPoints{tn}; % get the initial start point
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
        [x_result, k, funcEval] = CS_BFGS(func_handles{tn}, x0, H0, h, maxIter, tol, display);
        timetaking(trial_i) = toc;
    end
    st = sort(timetaking);
    % only average the time of top 5 runs
    timeResult(tn, 2) = sum(st(1:topTrial)) / topTrial; 
    iterationResult(tn, 2) = k; 
    funcEvalResult(tn, 2)= funcEval;

    % calculate the preformance ratio
    timeRatio(tn, 1) = timeResult(tn, 1) / min(timeResult(tn, 1), timeResult(tn, 2));
    timeRatio(tn, 2) = timeResult(tn, 2) / min(timeResult(tn, 1), timeResult(tn, 2));
    funcEvalRatio(tn, 1) = funcEvalResult(tn, 1) / min(funcEvalResult(tn, 1), funcEvalResult(tn, 2));
    funcEvalRatio(tn, 2) = funcEvalResult(tn, 2) / min(funcEvalResult(tn, 1), funcEvalResult(tn, 2));
end