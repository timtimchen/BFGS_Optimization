function [df] = D_Helical_valley(x)
% This function performs the gradient of Helical valley function. n = 3, m = 3. 
    theda = 0.0;
    if x(1) > 0
        theda = atan(x(2)/x(1))/(2*pi);
    end
    if x(1) < 0
        theda = atan(x(2)/x(1))/(2*pi) + 0.5;
    end
    D_theda_1 = -x(2)/((1+(x(2)/x(1))^2)*(2*pi)*(x(1)^2));
    D_theda_2 = 1/((1+(x(2)/x(1))^2)*(2*pi)*x(1));
    
    df = zeros(3, 1);
    df(1) = -2000*(x(3) - 10*theda)*D_theda_1 + 200*x(1)*(sqrt(x(1)^2 + x(2)^2) - 1)/sqrt(x(1)^2 + x(2)^2); 
    df(2) = -2000*(x(3) - 10*theda)*D_theda_2 + 200*x(2)*(sqrt(x(1)^2 + x(2)^2) - 1)/sqrt(x(1)^2 + x(2)^2); 
    df(3) = 200*(x(3) - 10*theda) + 2*x(3);
end