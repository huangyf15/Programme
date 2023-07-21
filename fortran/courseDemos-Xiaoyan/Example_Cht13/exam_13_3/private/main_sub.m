function main_sub()
%{
  PROGRAM: subfunc
  PURPOSE: 本函数包含两个子函数，放在private子目录中
  PROGRAMMER: 向志海
  DATE: Dec 15, 2010
%}
  
% 调用子函数
subfunc2;

% Subfunctions
function subfunc1()
disp('In subfunc1 (private)');

function subfunc2()
disp('In subfunc2 (private)');
subfunc1;