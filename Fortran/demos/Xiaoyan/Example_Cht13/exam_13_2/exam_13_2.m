%{
  PROGRAM: exam_13_2
  PURPOSE: ��������ʾ��  
  PROGRAMMER: ��־��
  DATE:     Dec 14, 2010
  MODIFIED: Dec 13, 2012
%}
  
clear all;  % ���workspace�е����б���
clc;        % command window����

% ����뾶
r = 3;

% ������һ�ֵ��÷���
[a, l] = area_perimeter(r);

disp(['Radius:    ' num2str(r, '%3.1f\n')]);
disp(['Area:      ' num2str(a, '%3.1f\n')]);
disp(['Perimeter: ' num2str(l, '%3.1f\n')]);

% ����������һ�ֵ��÷�����ע������ֻ��һ���������
disp(['Area:      ' num2str(area_perimeter(r), '%3.1f\n')]);

% ֻ���صڶ�������
[,l] = area_perimeter(r);