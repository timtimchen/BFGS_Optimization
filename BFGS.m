function [X, iter] = BFGS(func, dfunc, x0, H0, maxIter, toler, display)
% Function BFGS performs multivariate local optimization using the BFGS method.
% Input
%   func:    the object function handle, the function should be analytic
%   dfunc:   the derivative function handle
%   x0:      vector of initial start
%   H0:      initial approximate inverse Hessian
%   maxIter: max number of iteration  
%   toler:   tolerance for the norm of the gradient
%   display: true/false a trigger for debugging display
% Output
%   X:       a series of values of the optimizing variable
%   iter:    total run iteration number

    n = length(x0); % get the dimension of the variable
    I = eye(n , n); % create a identity matrix
    H_k = H0; % approximate inverse Hessian in current step

    % store the variable value of each iteration as the result X
    X = zeros(n, maxIter+1);
    X(:, 1) = x0; % initial x0 at iteration 1

    for iter = 1 : maxIter
        % compute the gradient of the current step
        g0 = feval(dfunc, X(:, iter));  

        % print out debug information
        fx = feval(func, X(:, iter));
        if (display)
            x_print = sprintf('%f ', X(:, iter));
            g_print = sprintf('%f ', g0);
            fprintf('iter: %d, f(x)= %.10f, x=[%s], g=[%s]\n', iter, fx, x_print, g_print);
        end

        % check if the norm of the gradient meet the stop criteria
        fnorm = norm(g0)/sqrt(n);
        if fnorm < toler
            break;
        end

        % get the search direction by multiplying approximate inverse Hessian and the gradient
        direction = - H_k * g0;
        
        % line search
        %alpha = 0.1;
        alpha = wolfe_line_search(func, dfunc, X(:, iter), fx, g0, direction);

        % update the variable for next iteration
        X(:, iter+1) = X(:, iter) + alpha * direction;

        % update the approximate inverse Hessian with the BFGS Method
        s0 = X(:, iter+1) - X(:, iter);
        g1 = feval(dfunc, X(:, iter+1));
        y0 = g1-g0;
        demoniator = transpose(y0)*s0;
        H_k = (I - (s0*transpose(y0))./demoniator) * H_k * (I - (y0*transpose(s0))./demoniator) + (s0 * transpose(s0))./demoniator;

    end

    % print out debug information
    if (display)
        if (iter < maxIter)
            fprintf('Optimization finished at iteration: %d.\n', iter);
        else
            fprintf('Fail to find the minimizer.\n');
        end
    end
end


function alpha = wolfe_line_search(func, dfunc, x0, f0, g0, dir)
% function wolfe_line_search perform a line search to find a step length satisfying the strong Wolfe conditions
% referrence: Algorithm 3.5. Page 60. "Numerical Optimization". Nocedal & Wright.
% INPUTS:
%  func: the object function handle
%  dfunc:   the derivative function handle
%  x0: input variable vector
%  f0: input function evaluation
%  g0: input objective gradient vector
%  dir: input search direction vector
% OUTPUTS:
% alpha: search length

    % initialize variables
    c1 = 1e-6;
    c2 = 0.9;
    alpha_max = 2.5;
    alpha_im1 = 0;
    alpha_i = 1;
    f_im1 = f0;
    dphi0 = transpose(g0)*dir;
    i = 0;
    max_iters = 20;

    % search for alpha that satisfies strong-Wolfe conditions
    while true
  
        x = x0 + alpha_i * dir;
        f_i = feval(func, x);
        g_i = feval(dfunc, x);
        if (f_i > f0 + c1*dphi0) || ( (i > 1) && (f_i >= f_im1) )
            alpha = zoom(func, dfunc, x0, f0, g0, dir, alpha_im1, alpha_i);
            break;
        end
        dphi = transpose(g_i) * dir;
        if ( abs(dphi) <= -c2*dphi0 )
            alpha = alpha_i;
            break;
        end
        if ( dphi >= 0 )
            alpha = zoom(func, dfunc, x0, f0, g0, dir, alpha_i, alpha_im1);
            break;
        end
  
        % update
        alpha_im1 = alpha_i;
        f_im1 = f_i;
        alpha_i = alpha_i + 0.8*(alpha_max-alpha_i);
  
        if (i > max_iters)
            alpha = alpha_i;
            break;
        end
  
        i = i+1;
  
    end

end

function alpha = zoom(func, dfunc, x0, f0, g0, dir, alpha_lower, alpha_upper)
% function zoom perform Interpolation to finda trial step length between (alpha_lower, alpha_upper)
% referrence: Algorithm 3.6, Page 61. "Numerical Optimization". Nocedal & Wright.
% INPUTS:
%  func: the objective function handle
%  dfunc:   the derivative function handle
%  x0: input variable vector
%  f0: input function evaluation
%  g0: input objective gradient vector
%  dir: input search direction vector
%  alpha_lower: lower bound of alpha
%  alpha_upper: upper bound of alpha
% OUTPUTS:
%  alpha: zoomed alpha

    % initialize variables
    c1 = 1e-4;
    c2 = 0.9;
    i = 0;
    max_iters = 20;
    dphi0 = transpose(g0) * dir;

    while true
        alpha_i = 0.5*(alpha_lower + alpha_upper);
        alpha = alpha_i;
        x = x0 + alpha_i*dir;
        f_i = feval(func,x);
        g_i = feval(dfunc, x);
        x_lo = x0 + alpha_lower*dir;
        f_lo = feval(func, x_lo);
        if ( (f_i > f0 + c1*alpha_i*dphi0) || ( f_i >= f_lo) )
            alpha_upper = alpha_i;
        else
            dphi = transpose(g_i)*dir;
            if ( ( abs(dphi) <= -c2*dphi0 ) )
                alpha = alpha_i;
                break;
            end
            if ( dphi * (alpha_upper-alpha_lower) >= 0 )
                alpha_upper = alpha_lower;
            end
            alpha_lower = alpha_i;
        end
        i = i+1;
        if (i > max_iters)
            alpha = alpha_i;
            break;
        end
    end

end
