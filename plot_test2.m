clear,clc
fig = figure;
% randomly choose a start point
x0 = -2.5 + rand()*5;
y0 = -1 + rand()*5;

[X,Y] = meshgrid(-2.5:0.1:2.5, -1:0.1:4);
F = (1-X).^2 + 100.*(Y-X.^2).^2;

radius = 0.8;
idx = 1;
old{idx} = [x0,y0];
fidx = 0;

while radius > 0.1
    % draw contours as background (Rosenbrock function)
    hold on;
    contour(X,Y,F,30);
    for i = 1:idx
        plot(old{i}(1),old{i}(2),'ko','LineWidth',5);
    end
    %if idx > 1
        %plot(old{idx-1}(1),old{idx-1}(2),'ko','LineWidth',5);
    %end
    f0 = rosenbrock(x0, y0);
    plot(x0, y0,'bo','LineWidth',5);
    pause(0.5);
    fidx = fidx + 1;
    frame = getframe(fig);
    im{fidx} = frame2im(frame);

    theda1 = rand() * 2 * pi;
    x1 = x0 + radius * cos(theda1);
    y1 = y0 + radius * sin(theda1);
    f1 = rosenbrock(x1, y1);
    theda2 = rand() * 2 * pi;
    x2 = x0 + radius * cos(theda2);
    y2 = y0 + radius * sin(theda2);
    f2 = rosenbrock(x2, y2);
    line([x0,x1],[y0,y1],'Color','black','LineWidth',2);
    line([x0,x2],[y0,y2],'Color','black','LineWidth',2);
    plot(x1, y1,'go','LineWidth',5);
    plot(x2, y2,'go','LineWidth',5);
    plot(x0, y0,'bo','LineWidth',5);
    pause(0.5);
    fidx = fidx + 1;
    frame = getframe(fig);
    im{fidx} = frame2im(frame);

    if f0 < min(f1, f2)
        radius = radius * 0.85;
    else
        radius = radius * 1.3;
        if f1 < f2
            x0 = x1;
            y0 = y1;
            plot(x1, y1,'ro','LineWidth',5);
            plot(x2, y2,'go','LineWidth',5);
        else
            x0 = x2;
            y0 = y2;
            plot(x1, y1,'go','LineWidth',5);
            plot(x2, y2,'ro','LineWidth',5);
        end
    end
    pause(0.5);
    fidx = fidx + 1;
    frame = getframe(fig);
    im{fidx} = frame2im(frame);

    idx = idx + 1;
    old{idx} = [x0,y0];
    clf(fig);
end

hold on;
contour(X,Y,F,30);
for i = 1:idx
    plot(old{i}(1),old{i}(2),'ko','LineWidth',5);
end
%if idx > 1
    %plot(old{idx-1}(1),old{idx-1}(2),'ko','LineWidth',5);
%end
plot(x0, y0,'ro','LineWidth',5);

fidx = fidx + 1;
frame = getframe(fig);
im{fidx} = frame2im(frame);
filename = "animated.gif"; % Specify the output file name
for ii = 1:fidx
    [A,map] = rgb2ind(im{ii},256);
    if ii == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1);
    end
end

% Use Rosenbrock as objective function (2D)
function ret = rosenbrock(x, y)
    ret = (1-x).^2 + 100.*(y-x.^2).^2;
end
