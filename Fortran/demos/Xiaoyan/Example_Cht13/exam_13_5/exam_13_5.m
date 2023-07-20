%{
  PROGRAM: exam_13_5
  PURPOSE: 用牛顿法解方程，其解对初值非常敏感  
  PROGRAMMER: 向志海
  DATE: Dec 18, 2010
%}
  
clear all;  % 清除workspace中的所有变量
close all;  % 清除所有图形窗口
clc;        % command window清屏

% 产生初值点
x = -1.2:0.005:1.2;
y = x;
L = length(x);

% 根据初值点最后收敛到的解，来设定其颜色
color  = zeros(L, L,'int8');
for i = 1:L
    disp(['i = ' num2str(i)]);
    for j = 1:L
        color(i,j) = getcolor(x(i),y(j));
    end
end

% 画出每个初值点的颜色
figure(1);
RGBmap = [1 0 0; 0 1 0; 0 0 1]; % 定义红、绿、蓝三种颜色
image(x, y, color);
colormap(RGBmap);

