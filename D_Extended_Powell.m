function [df] = D_Extended_Powell(x)
% This function performs the gradient of Extended Powell function. 
% dimension n must be a multiple of 4, depended on the input x, m = n. 

    k = round(length(x)/4);
    df = zeros(4*k,1);
    for i = 1:k
        df(4*i-3) = 2*(x(4*i-3)+10*x(4*i-2))+ 40*(x(4*i-3)-x(4*i))^3;
        df(4*i-2) = 20*(x(4*i-3)+10*x(4*i-2))+ 4*(x(4*i-2)-2*x(4*i-1))^3;
        df(4*i-1) = 10*(x(4*i-1)-x(4*i)) - 8*(x(4*i-2)-2*x(4*i-1))^3;
        df(4*i) = -10*(x(4*i-1)-x(4*i)) - 40*(x(4*i-3)-x(4*i))^3;
    end
end