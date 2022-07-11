function [df] = D_Kowalik_and_Osborne(x)
% This function performs the gradient of Kowalik and Osborne function. n = 4, m = 11.

    y = [0.1957; 0.1947; 0.1735; 0.16; 0.0844; 0.0627; 0.0456; 0.0342; 0.0323; 0.0235; 0.0246];
    u = [4.0; 2.0; 1.0; 0.5; 0.25; 0.167; 0.125; 0.1; 0.0833; 0.0714; 0.0625];
    
    f_i = y - x(1) .* (u.^2 + u .* x(2)) ./ (u.^2 + u.*x(3) + x(4));
    df = zeros(4,1);

    df(1) = sum(-2 .* f_i .* (u.^2 + u .* x(2)) ./ (u.^2 + u.*x(3) + x(4)));
    df(2) = sum(-2 .* f_i .* x(1) .* u ./ (u.^2 + u.*x(3) + x(4)));
    df(3) = sum(2 .* u .* f_i .* x(1) .* (u.^2 + u .* x(2)) ./ (u.^2 + u.*x(3) + x(4)).^2);
    df(4) = sum( 2 .* f_i .* x(1) .* (u.^2 + u .* x(2)) ./ (u.^2 + u.*x(3) + x(4)).^2);
end