function [df] = D_Freudenstein_and_Roth(x)
% This function performs the gradient of Freudenstein and Roth function. n=2, m=2.
    
    df = zeros(2, 1);
    df(1) = 2*(-13 + x(1) - 2*x(2) + 5*x(2)^2 -x(2)^3) + 2*(-29 + x(1) -14*x(2) + x(2)^2 + x(2)^3); 
    df(2) = 2*(-13 + x(1) - 2*x(2) + 5*x(2)^2 -x(2)^3)*(-2 + 10*x(2)-3*x(2)^2) + 2*(-29 + x(1) -14*x(2) + x(2)^2 + x(2)^3) * (-14 + 2*x(2) + 3*x(2)^2);
end