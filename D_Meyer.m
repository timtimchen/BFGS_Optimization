function [df] = D_Meyer(x)
% This function performs the gradient of Meyer function. n = 3, m = 16. 

    y = [34780; 28610; 23650; 19630; 16370; 13720; 11540; 9744; 8261; 7030; 6005; 5147; 4427; 3820; 3307; 2872];
    df = zeros(3,1);
    for i = 1:16
        t = 45 + 5*i;
        df(1) = df(1) + 2*(x(1)*exp(x(2)/(t+x(3))) - y(i))*exp(x(2)/(t+x(3)));
        df(2) = df(2) + 2*(x(1)*exp(x(2)/(t+x(3))) - y(i))*x(1)*exp(x(2)/(t+x(3)))/(t+x(3));
        df(3) = df(3) - 2*(x(1)*exp(x(2)/(t+x(3))) - y(i))*x(1)*x(2)*exp(x(2)/(t+x(3)))/(t+x(3))^2;
    end
end