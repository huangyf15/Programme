function main_sub()
%{
  PROGRAM: subfunc
  PURPOSE: ���������������Ӻ���������private��Ŀ¼��
  PROGRAMMER: ��־��
  DATE: Dec 15, 2010
%}
  
% �����Ӻ���
subfunc2;

% Subfunctions
function subfunc1()
disp('In subfunc1 (private)');

function subfunc2()
disp('In subfunc2 (private)');
subfunc1;