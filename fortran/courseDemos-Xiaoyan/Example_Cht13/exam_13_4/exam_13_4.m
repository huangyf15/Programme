%{
  PROGRAM: exam_13_4
  PURPOSE: ͼ�β���ʾ��  
  PROGRAMMER: ��־��
  DATE:     Dec 18, 2010
  Modified: Dec 18, 2013
%}
  
clear all;  % ���workspace�е����б���
close all;  % �������ͼ�δ���
clc;        % command window����

% ��һ�������л�һ������
figure(1);
x = 0:pi/90:2*pi;
plot(x * 180 / pi,sin(x));
xlabel('x (degree)');
ylabel('sin(x)');
title('Plot a sine curve');

figure(2);
plot(x * 180 / pi,sin(x).*cos(x));
xlabel('x (degree)');
ylabel('sin(x) * cos(x)');
title('Plot a combined sin and cos curve');
grid on;    % ����ͼ������

% ��һ�������л���������
figure(3);
plot(x * 180 / pi,sin(x));
hold on;
plot(x * 180 / pi,cos(x), 'ro-');
xlabel('x (degree)');
ylabel('Values');
title('Plot a sine and a cosine curve');
legend('sin(x)','cos(x)','Location','North');
hold off;

figure(3); % ������Plot toolȥ�ı�ͼ�ε�����
plot(x * 180 / pi,sin(x), 'k-', x * 180 / pi,cos(x), 'bx-');
xlabel('x (degree)');
ylabel('Values');
title('Plot a sine and a cosine curve');
legend('sin(x)','cos(x)','Location','North');

% ��ͼ���������ȡ��
[px, py] = ginput(1);
disp(['px = ' num2str(px) ' py = ' num2str(py)]);

% �Ӵ���
figure(4);
subplot(2,1,1);
plot(x * 180 / pi,sin(x));
xlabel('x (degree)');
ylabel('sin(x)');
subplot(2,1,2);
plot(x * 180 / pi,cos(x));
xlabel('x (degree)');
ylabel('cos(x)');
title('Plot a sine and a cosine curve');
%{
  ��������ͼ�ĺᡢ���������������������ͬʱ����
1����findobj�ҵ���ǰͼ��(gcf)��������ͼ��ͼ�ξ��(type = axes)
2����linkaxes���ҵ��ľ�����й���
%}
findobj(gcf,'type','axes');
linkaxes(ans);

% ��άͼ��
figure(5);
t = 0:0.1:10;
x = exp(-0.2 * t) .* cos(2 * t);
y = exp(-0.2 * t) .* sin(2 * t);
plot3(x,y,t);
xlabel('\bfx'); % ��\bf�Ӵ�����
ylabel('\bfy');
zlabel('\bftime');
grid on;

figure(6); 
[x, y] = meshgrid(-3:0.125:3);
z = peaks(x,y);
meshc(x,y,z);
axis([-3 3 -3 3 -10 10]);  % �趨������ķ�Χ
xlabel('\bfx');
ylabel('\bfy');
zlabel('\bfz');

