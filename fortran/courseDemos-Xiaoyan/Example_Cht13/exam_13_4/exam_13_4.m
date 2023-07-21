%{
  PROGRAM: exam_13_4
  PURPOSE: 图形操作示例  
  PROGRAMMER: 向志海
  DATE:     Dec 18, 2010
  Modified: Dec 18, 2013
%}
  
clear all;  % 清除workspace中的所有变量
close all;  % 清除所有图形窗口
clc;        % command window清屏

% 在一个窗口中画一条曲线
figure(1);
x = 0:pi/90:2*pi;
plot(x * 180 / pi,sin(x));
xlabel('x (degree)');
ylabel('sin(x)');
title('Plot a sine curve');

figure(2);
plot(x * 180 / pi,sin(x).*cos(x));
xlabel('x (degree)');
ylabel('sin(x) * cos(x)');
title('Plot a combined sin and cos curve');
grid on;    % 画出图形网格

% 在一个窗口中画多条曲线
figure(3);
plot(x * 180 / pi,sin(x));
hold on;
plot(x * 180 / pi,cos(x), 'ro-');
xlabel('x (degree)');
ylabel('Values');
title('Plot a sine and a cosine curve');
legend('sin(x)','cos(x)','Location','North');
hold off;

figure(3); % 试着用Plot tool去改变图形的属性
plot(x * 180 / pi,sin(x), 'k-', x * 180 / pi,cos(x), 'bx-');
xlabel('x (degree)');
ylabel('Values');
title('Plot a sine and a cosine curve');
legend('sin(x)','cos(x)','Location','North');

% 从图形中用鼠标取点
[px, py] = ginput(1);
disp(['px = ' num2str(px) ' py = ' num2str(py)]);

% 子窗口
figure(4);
subplot(2,1,1);
plot(x * 180 / pi,sin(x));
xlabel('x (degree)');
ylabel('sin(x)');
subplot(2,1,2);
plot(x * 180 / pi,cos(x));
xlabel('x (degree)');
ylabel('cos(x)');
title('Plot a sine and a cosine curve');
%{
  将两个子图的横、纵坐标轴关联起来，可以同时缩放
1）用findobj找到当前图形(gcf)的所有子图的图形句柄(type = axes)
2）用linkaxes将找到的句柄进行关联
%}
findobj(gcf,'type','axes');
linkaxes(ans);

% 三维图形
figure(5);
t = 0:0.1:10;
x = exp(-0.2 * t) .* cos(2 * t);
y = exp(-0.2 * t) .* sin(2 * t);
plot3(x,y,t);
xlabel('\bfx'); % 用\bf加粗字体
ylabel('\bfy');
zlabel('\bftime');
grid on;

figure(6); 
[x, y] = meshgrid(-3:0.125:3);
z = peaks(x,y);
meshc(x,y,z);
axis([-3 3 -3 3 -10 10]);  % 设定坐标轴的范围
xlabel('\bfx');
ylabel('\bfy');
zlabel('\bfz');

