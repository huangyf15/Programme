%{
  PROGRAM: exam_13_3
  PURPOSE: 函数调用的查找顺序示例  
  PROGRAMMER: 向志海
  DATE: Dec 15, 2010
%}
  
clear all;  % 清除workspace中的所有变量
clc;        % command window清屏

% 调用当前目录中的函数
sub;

% 调用不属于自己的子函数会出错
subfunc1;



