%{
  PROGRAM: exam_13_5
  PURPOSE: ��ţ�ٷ��ⷽ�̣����Գ�ֵ�ǳ�����  
  PROGRAMMER: ��־��
  DATE: Dec 18, 2010
%}
  
clear all;  % ���workspace�е����б���
close all;  % �������ͼ�δ���
clc;        % command window����

% ������ֵ��
x = -1.2:0.005:1.2;
y = x;
L = length(x);

% ���ݳ�ֵ������������Ľ⣬���趨����ɫ
color  = zeros(L, L,'int8');
for i = 1:L
    disp(['i = ' num2str(i)]);
    for j = 1:L
        color(i,j) = getcolor(x(i),y(j));
    end
end

% ����ÿ����ֵ�����ɫ
figure(1);
RGBmap = [1 0 0; 0 1 0; 0 0 1]; % ����졢�̡���������ɫ
image(x, y, color);
colormap(RGBmap);

