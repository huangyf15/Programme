function [a, l] = area_perimeter(radius)
% PROGRAM: area_perimeter
%{
  PURPOSE: ����Բ��������ܳ� 
  PROGRAMMER: ��־��
  DATE:     Dec 14, 2010
  MODIFIED: Dec 21, 2011
            Dec 15, 2013
 %}

% ����Ƿ���ʵ�δ��ݽ��� (�μ����µ�narginchk����)
msg = nargchk(1,1,nargin);  % nargin��ʵ�ε���Ŀ������Ҫ����ֻ����1
error(msg);

% ���뾶�Ƿ�����
if radius <= 0
    msg = 'Radius is not positive!';
    warning(msg);
end

% �鿴ʵ�ε�����
disp(['Radius name: ' inputname(1)]);

% ����Բ���
a = pi * radius^2;

% ���еڶ����������ʱ�ż���Բ���ܳ�
if nargout == 2
    l = 2 * pi * radius;
end

radius = 0;   % ��Ϊ��call by value�����Բ���Ӱ���������е�rֵ