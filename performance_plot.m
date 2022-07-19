function [] = performance_plot(table)
    [n , m] = size(table);
    y = (1 : n)' ./ n;
    x1 = sort(table(:, 1));
    x2 = sort(table(:, 2));
    %x1 = log2(sort(table(:, 1)));
    %x2 = log2(sort(table(:, 2)));

    y1 = zeros(2*(n-1),1);
    x11 = zeros(2*(n-1),1);
    x12 = zeros(2*(n-1),1);
    for i = 1 : 2*(n-1)
        j = round((i + 1) / 2);
        y1(i) = round((i) / 2) ./ n;
        x11(i) = x1(j);
        x12(i) = x2(j);
    end
    x11(2*(n-1)) = max([x11(2*(n-1)),x12(2*(n-1))]);
    x12(2*(n-1)) = max([x11(2*(n-1)),x12(2*(n-1))]);

    figure;
    %plot(x1,y,'-o', x2, y, '-x');
    plot(x11,y1,'-o', x12, y1, '-x');
    legend('BFGS','CS-BFGS');
end