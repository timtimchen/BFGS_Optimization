%function [] = performance_plot(table)
    table = timeRatio;
    pTitle = 'Performance ratio of runtime    tol=1e-9,  h=1e-9';
    pyLabel = 'ρ(α)';
    pxLabel = 'time';

    [n , m] = size(table);
    sorted = sort(table, 1);
    
    yp = zeros(2*n,m);
    xp = zeros(2*n,m);

    for j = 1:m
        xp(1,j) = sorted(1,j);
        yp(1,j) = 1;
    end

    for i = 2:n
        for j = 1:m
            if sorted(i,j) < inf
                yp(2*(i-1),j) = yp(2*(i-1)-1,j);
                xp(2*(i-1),j) = sorted(i,j);
                yp(2*(i-1)+1,j) = yp(2*(i-1)-1,j)+1;
                xp(2*(i-1)+1,j) = sorted(i,j);
            else
                yp(2*(i-1),j) = yp(2*(i-1)-1,j);
                xp(2*(i-1),j) = xp(2*(i-1)-1,j);
                yp(2*(i-1)+1,j) = yp(2*(i-1)-1,j);
                xp(2*(i-1)+1,j) = xp(2*(i-1)-1,j);
            end
        end
    end

    x_max = 1.2 * max([xp(2*n-1,1), xp(2*n-1,2), xp(2*n-1,3), xp(2*n-1,4)]);
    for j = 1:m
        xp(2*n,j) = x_max;
        yp(2*n,j) = yp(2*n-1,j);
    end

    yp = yp ./ n;
 
    figure;
    plot(xp(:,1),yp(:,2),'-o', xp(:,2), yp(:,2), '-x', xp(:,3), yp(:,3), '-^', xp(:,4), yp(:,4), '-s');
    legend('BFGS','BFGS-AP-CS', 'BFGS-AG-Oh', 'BFGS-AG-Oh2');

    title(pTitle);
    xlabel(pxLabel);
    ylabel(pyLabel);
%end