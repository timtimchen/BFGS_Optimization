clear;
maxIter = 10000; % max iteration number of each run, if the algorithm end at the max iteration it indicate the optimazation is not converged.
totalTest = 29; % total number of problems in the test set
trial = 20; % number of trials of each algorithm
topTrial = 5; % number of fasting trials of each algorithm, used to find average the running time
tol = 1e-9; % the convergence tolerance for the projected gradient
optTol = tol; % the tolerance for relative error between the converge function values and the true minimums
h = tol; % the convergence tolerance for the projected gradient
display = false; % whether print iterations details


% Our test set consists of the following functions, gradients, start points, and true minimums,
% which are chosen and retrieved from:
% J.J. More, B.S. Garbow, and K.E. Hillstrom. Testing unconstrained optimization software.
% Chapter 3 Test Functions. P21 - P29

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
    @Osborne_1;
    @Biggs_EXP6;
    @Osborne_2;
    @Watson;
    @Extended_Rosenbrock;
    @Extended_Powell;
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
    @D_Osborne_1;
    @D_Biggs_EXP6;
    @D_Osborne_2;
    @D_Watson;
    @D_Extended_Rosenbrock;
    @D_Extended_Powell;
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
[0.5, 1.5, -1, 0.01, 0.02];
[1; 2; 1; 1; 1; 1];
[1.3; 0.65; 0.65; 0.7; 0.6; 3; 5; 7; 2; 4.5; 5.5];
zeros(6,1);
[-1.2, 1, -1.2, 1, -1.2, 1, -1.2, 1];
[3; -1; 0; 1; 3; -1; 0; 1; 3; -1; 0; 1];
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
(1:10)'/(10+1)};

% minimums of each problems in the test set
minimums = [0.0;
48.9842536792;   %48.9842;
0.0;
0.0;
0.0;
0.0;
0.00821487730658;    %8.21487e-3;
1.12793276962e-08;   %1.12793e-8;
0.0;
0.0;
0.0;
0.000307505603849;   %3.07505e-4;
5.46489469748e-05;   %5.46489e-5;
0.0056556499255;   %5.65565e-3;
0.0401377362935;   %4.01377e-2;
0.00228767005355;   %2.28767e-3;
0.0;
0.0;
0.000293660537457;   %2.93660e-4;
0.0;
0.0;
0.0;
0.0;
0.0;
0.0;
6.0;
15/7;
62/17;
0.00650395480088];
%6.50395e-3];

% initial tables to store the running time result, rows for defferent
% problem test, column 1 for BFGS algorithm, 
% column 2 for BFGS with an approximate gradient by complex Step
% column 3 for BFGS with an approximate gradient by df = (f(x+h) - f(x)) / h
% column 4 for BFGS with an approximate gradient by df = (f(x+h) - f(x-h)) / 2h

isSolved = false(totalTest, 4); % true if the algorithm find the minimum (relative error less than tolerence)
timeResult = zeros(totalTest, 4); % average time per run (averaging from fastest 5 runs)
iterationResult = zeros(totalTest, 4); % total iteration to terminate
funcEvalResult = zeros(totalTest, 4); % total times of function evaluations per run
timeRatio = zeros(totalTest, 4); % for time performance profile
funcEvalRatio = zeros(totalTest, 4); % for function evaluations performance profile

% run each problem, optimizated it with four different versions of BFGS algorithm separately
for tn = 1 : totalTest
    x0 = initPoints{tn}; % get the initial start point
    n = length(x0); % get the dimension
    H0 = eye(n); % use idintity matrix as the initial Hessian

    % run BFGS algorithm on the test problem several times and record the
    % running time, total iterations, and total number of function evaluate
    timetaking = zeros(trial, 1);
    for trial_i = 1:trial
        tic;
        [y_result, x_result, k, funcEval] = BFGS(func_handles{tn}, grad_handles{tn}, x0, H0, maxIter, tol, display);
        timetaking(trial_i) = toc;
        % if the algorithm failed to converge, no need to run the rest trails
        if k >= maxIter
            break;
        end
    end
    iterationResult(tn, 1) = k; 
    if k < maxIter
        st = sort(timetaking); 
        % only average the time of top 5 runs
        timeResult(tn, 1) = sum(st(1:topTrial)) / topTrial; 
        % record the function evaluation by the total function evaluation divide by (dimension + 1)
        funcEvalResult(tn, 1)= funcEval / (n + 1);
        %calculate relative error between the converge function values and the
        %true minimums and compare to the given tolerence
        %if the minimums is zero then use the absolute error instead
        if minimums(tn) == 0
            optError = abs(y_result(k) - minimums(tn));
        else
            optError = abs((y_result(k) - minimums(tn))/minimums(tn));
        end
        isSolved(tn, 1) = optError < optTol;
        if optError >= optTol
            timeResult(tn, 1) = Inf;
            funcEvalResult(tn, 1)= Inf;
            %fprintf("%d,1 : %.12f, %.12f, %.12f\n", tn, y_result(k), minimums(tn), optError);
        end
    else
        % if the algorithm failed to converge, set results as follows
        timeResult(tn, 1) = Inf;
        funcEvalResult(tn, 1)= Inf;
        isSolved(tn, 1) = false;
    end

    % run BFGS_AG_CS algorithm on the test problem several times and record the
    % running time, total iterations, and total number of function evaluate
    for trial_i = 1:trial
        tic;
        [y_result, x_result, k, funcEval] = BFGS_AG_CS(func_handles{tn}, x0, H0, h, maxIter, tol, display);
        timetaking(trial_i) = toc;
        % if the algorithm failed to converge, no need to run the rest
        if k >= maxIter
            break;
        end
    end
    iterationResult(tn, 2) = k;
    if k < maxIter
        st = sort(timetaking);
        % only average the time of top 5 runs
        timeResult(tn, 2) = sum(st(1:topTrial)) / topTrial; 
        % record the function evaluation by the total function evaluation divide by (dimension + 1)
        funcEvalResult(tn, 2)= funcEval / (n + 1);
        %calculate relative error between the converge function values and the
        %true minimums and compare to the given tolerence
        %if the minimums is zero then use the absolute error instead
        if minimums(tn) == 0
            optError = abs(y_result(k) - minimums(tn));
        else
            optError = abs((y_result(k) - minimums(tn))/minimums(tn));
        end
        isSolved(tn, 2) = optError < optTol;
        if optError >= optTol
            timeResult(tn, 2) = Inf;
            funcEvalResult(tn, 2)= Inf;
            %fprintf("%d,2 : %.12f, %.12f, %.12f\n", tn, y_result(k), minimums(tn), optError);
        end
    else
        % if the algorithm failed to converge, set results as follows
        timeResult(tn, 2) = Inf;
        funcEvalResult(tn, 2)= Inf;
        isSolved(tn, 2) = false;
    end

    % run BFGS_AG_Oh algorithm on the test problem several times and record the
    % running time, total iterations, and total number of function evaluate
    for trial_i = 1:trial
        tic;
        [y_result, x_result, k, funcEval] = BFGS_AG_Oh(func_handles{tn}, x0, H0, h, maxIter, tol, display);
        timetaking(trial_i) = toc;
        % if the algorithm failed to converge, no need to run the rest
        if k >= maxIter
            break;
        end
    end
    iterationResult(tn, 3) = k;
    if k < maxIter
        st = sort(timetaking);
        % only average the time of top 5 runs
        timeResult(tn, 3) = sum(st(1:topTrial)) / topTrial; 
        % record the function evaluation by the total function evaluation divide by (dimension + 1)
        funcEvalResult(tn, 3)= funcEval / (n + 1);
        %calculate relative error between the converge function values and the
        %true minimums and compare to the given tolerence
        %if the minimums is zero then use the absolute error instead
        if minimums(tn) == 0
            optError = abs(y_result(k) - minimums(tn));
        else
            optError = abs((y_result(k) - minimums(tn))/minimums(tn));
        end
        isSolved(tn, 3) = optError < optTol;
        if optError >= optTol
            timeResult(tn, 3) = Inf;
            funcEvalResult(tn, 3)= Inf;
            %fprintf("%d,3 : %.12f, %.12f, %.12f\n", tn, y_result(k), minimums(tn), optError);
        end
    else
        % if the algorithm failed to converge, set results as follows
        timeResult(tn, 3) = Inf;
        funcEvalResult(tn, 3)= Inf;
        isSolved(tn, 3) = false;
    end

    % run BFGS_AG_Oh2 algorithm on the test problem several times and record the
    % running time, total iterations, and total number of function evaluate
    for trial_i = 1:trial
        tic;
        [y_result, x_result, k, funcEval] = BFGS_AG_Oh2(func_handles{tn}, x0, H0, h, maxIter, tol, display);
        timetaking(trial_i) = toc;
        % if the algorithm failed to converge, no need to run the rest
        if k >= maxIter
            break;
        end
    end
    iterationResult(tn, 4) = k;
    if k < maxIter
        st = sort(timetaking);
        % only average the time of top 5 runs
        timeResult(tn, 4) = sum(st(1:topTrial)) / topTrial; 
        % record the function evaluation by the total function evaluation divide by (dimension + 1)
        funcEvalResult(tn, 4)= funcEval / (n + 1);
        %calculate relative error between the converge function values and the
        %true minimums and compare to the given tolerence
        %if the minimums is zero then use the absolute error instead
        if minimums(tn) == 0
            optError = abs(y_result(k) - minimums(tn));
        else
            optError = abs((y_result(k) - minimums(tn))/minimums(tn));
        end
        isSolved(tn, 4) = optError < optTol;
        if optError >= optTol
            timeResult(tn, 4) = Inf;
            funcEvalResult(tn, 4)= Inf;
            %fprintf("%d,4 : %.12f, %.12f, %.12f\n", tn, y_result(k), minimums(tn), optError);
        end
    else
        % if the algorithm failed to converge, set results as follows
        timeResult(tn, 4) = Inf;
        funcEvalResult(tn, 4)= Inf;
        isSolved(tn, 4) = false;
    end

    % calculate the preformance ratio of each algorithm
    minTime = min([timeResult(tn, 1); timeResult(tn, 2); timeResult(tn, 3); timeResult(tn, 4)]);
    timeRatio(tn, 1) = timeResult(tn, 1) / minTime;
    timeRatio(tn, 2) = timeResult(tn, 2) / minTime;
    timeRatio(tn, 3) = timeResult(tn, 3) / minTime;
    timeRatio(tn, 4) = timeResult(tn, 4) / minTime;

    minFuncEval = min([funcEvalResult(tn, 1); funcEvalResult(tn, 2); funcEvalResult(tn, 3); funcEvalResult(tn, 4)]);
    funcEvalRatio(tn, 1) = funcEvalResult(tn, 1) / minFuncEval;
    funcEvalRatio(tn, 2) = funcEvalResult(tn, 2) / minFuncEval;
    funcEvalRatio(tn, 3) = funcEvalResult(tn, 3) / minFuncEval;
    funcEvalRatio(tn, 4) = funcEvalResult(tn, 4) / minFuncEval;

    fprintf("finished test case: %d\n", tn);
end

save data_run.mat
