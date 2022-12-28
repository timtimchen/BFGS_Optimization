%function [] = performance_plot(table)
    table = timeRatio;
    %table = funcEvalRatio;

    pTitle = '$\varepsilon=10^{-6},  h=10^{-3}$';

    %pxLabel = 'Runtime Ratio';
    %pyLabel = 'ρ(α)';
    %pxLabel = 'Evaluation Ratio';

    [n , m] = size(table);
    sorted = sort(table, 1);
    
    yp = zeros(2*n,m);
    xp = zeros(2*n,m);

    for j = 1:m
        if isinf(sorted(1,j))
            xp(1,j) = 1;
            yp(1,j) = 0;
        else
            xp(1,j) = sorted(1,j);
            yp(1,j) = 1;
        end
    end

    for i = 2:n
        for j = 1:m
            if isinf(sorted(i,j))
                yp(2*(i-1),j) = yp(2*(i-1)-1,j);
                xp(2*(i-1),j) = xp(2*(i-1)-1,j);
                yp(2*(i-1)+1,j) = yp(2*(i-1)-1,j);
                xp(2*(i-1)+1,j) = xp(2*(i-1)-1,j);
            else
                yp(2*(i-1),j) = yp(2*(i-1)-1,j);
                xp(2*(i-1),j) = sorted(i,j);
                yp(2*(i-1)+1,j) = yp(2*(i-1)-1,j)+1;
                xp(2*(i-1)+1,j) = sorted(i,j);
            end
        end
    end

    x_max = 1.2 * max([xp(2*n-1,1), xp(2*n-1,2), xp(2*n-1,3), xp(2*n-1,4)]);
    for j = 1:m
        xp(2*n,j) = x_max;
        xp(2*n,j) = 15;
        yp(2*n,j) = yp(2*n-1,j);
    end

    yp = yp ./ n;
 
    figure;
    plot(xp(:,1),yp(:,1),'r-', xp(:,2), yp(:,2),'g:', xp(:,3), yp(:,3),'k-.', xp(:,4), yp(:,4),'b--','LineWidth',2);
    legend('BFGS','BFGS-AP-CS', 'BFGS-AG-Oh', 'BFGS-AG-Oh2');
    ylim([0 1.05]);
    xlim([0.95 15]);
    title(pTitle, 'Interpreter','latex');
    %xlabel(pxLabel);
    %ylabel(pyLabel);
%end