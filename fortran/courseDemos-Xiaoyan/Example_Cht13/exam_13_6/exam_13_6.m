clear all;
close all;
clc;

% �����趨
nelx    = 200;  % ��x���򻮷ֵĵ�Ԫ��Ŀ
nely    = 100;   % ��y���򻮷ֵĵ�Ԫ��Ŀ
volfrac = 0.5;  % ���ϵĿռ��
penal   = 3;    % �����ӵ��ݴ�
rmin    = 1.5;  % �������İ뾶
ft      = 2;    % ft = 1: ���������ȹ��ˣ�ft = 2�������ܶȹ���

% �����Ż�������ʾ���
top88(nelx,nely,volfrac,penal,rmin,ft);
