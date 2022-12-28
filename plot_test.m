clear,clc
[X,Y] = meshgrid(-2:0.1:2, -1:0.1:4);
% draw contours as background (Rosenbrock function)
F = (1-X).^2 + 100.*(Y-X.^2).^2;
fig = figure;
contour(X,Y,F,30);
hold on;
x2 = 0;
y2 = 0;
minimum = inf;

% set a number of total iteration
maxTrail = 100;
% for each iteration, grenaral a random point on Omega = [-2,2]x[-1,4]
% evaluate the objective function at that point, and compare to the
% current best point which stored in (x2, y2)
for idx = 1 : maxTrail
    %pause(1);
    x1 = -2 + rand()*4;
    y1 = -1 + rand()*5;
    if rosenbrock(x1,y1) < minimum
        plot(x1, y1,'rx','LineWidth',2,'MarkerSize',10);
        if idx > 1
            plot(x2, y2, 'kx','LineWidth',2,'MarkerSize',10);
        end
        x2 = x1;
        y2 = y1;
        minimum = rosenbrock(x1,y1);
    else
        plot(x1, y1,'kx','LineWidth',2,'MarkerSize',10);
    end
    drawnow;
    frame = getframe(fig);
    im{idx} = frame2im(frame);
end

% output the image frames as GIF
filename = "animated.gif"; % Specify the output file name
for idx = 1:100
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1);
    end
end

% Use Rosenbrock as objective function (2D)
function ret = rosenbrock(x, y)
    ret = (1-x).^2 + 100.*(y-x.^2).^2;
end
