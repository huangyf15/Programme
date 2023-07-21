%{
  PROGRAM: exam_13_2
  PURPOSE: 函数调用示例  
  PROGRAMMER: 向志海
  DATE:     Dec 14, 2010
  MODIFIED: Dec 13, 2012
%}
  
clear all;  % 清除workspace中的所有变量
clc;        % command window清屏

% 定义半径
r = 3;

% 函数的一种调用方法
[a, l] = area_perimeter(r);

disp(['Radius:    ' num2str(r, '%3.1f\n')]);
disp(['Area:      ' num2str(a, '%3.1f\n')]);
disp(['Perimeter: ' num2str(l, '%3.1f\n')]);

% 函数的另外一种调用方法（注意这里只有一个输出量）
disp(['Area:      ' num2str(area_perimeter(r), '%3.1f\n')]);

% 只返回第二个参数
[,l] = area_perimeter(r);