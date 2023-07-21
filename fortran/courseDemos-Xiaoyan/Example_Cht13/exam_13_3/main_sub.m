function main_sub()
%{
  PROGRAM: subfunc
  PURPOSE: 本函数包含一个子函数，放在当前目录中
  PROGRAMMER: 向志海
  DATE: Dec 15, 2010
%}
  
% 调用子函数
subfunc1;

% Subfunctions
function subfunc1()
disp('In subfunc1');
