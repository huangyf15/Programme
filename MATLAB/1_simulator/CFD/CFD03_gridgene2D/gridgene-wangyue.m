f = @(x)0.75.*(0.2969.*sqrt(x) - 0.126.*x - 0.3516.*x.^2 + 0.2843*x.^3 - 0.1036.*x.^4);
%��Laplace���̣�����C������
%���ü���ƽ�棬�������߽�����
%2*M+100=2*N2+2*N1
M = 50;
N1 = 60;
N2 = 40;
x = zeros(1+2*N2+2*N1,1+N1);
y = zeros(1+2*N2+2*N1,1+N1);
%X��ֵ
x(1,1:1:1+N1) = 20; 												       %A��B
x(1:1:1+N2, 1+N1) = linspace(20,-20,1+N2);						           %B��C
x(1+N2:1:1+N2+2*N1,1+N1) = -20;										       %C��D
x(1+N2+2*N1:1:1+2*N2+2*N1, 1+N1) = linspace(-20,20,1+N2);	               %D��E
x(1+2*N2+2*N1, 1+N1:-1:1) = 20;										       %E��F
x(1+2*N2+2*N1:-1:1+2*N2+2*N1-M, 1) = linspace(20,1,1+M);				   %F��G
x(1+2*N2+2*N1-M:-1:1+M, 1) = [linspace(1,0,51) linspace(0.02,1,50)];       %G��H
x(1+M:-1:1, 1) = linspace(1,20,1+M);					            	   %H��A
%��X�� TFI ��ʼ��
for i = 2:2*N2+2*N1
    for j = 2:N1
       	r = (i-1)/(2*N2+2*N1);
       	s = (j-1)/N1;
       	x1 = (1-r)*x(1,j) + r*x(1+2*N2+2*N1,j);
       	x2 = (1-s)*x(i,1) + s*x(i,1+N1);
       	x3 = (1-s)*((1-r)*x(1,1)+r*x(1+2*N2+2*N1,1)) + s*((1-r)*x(1,1+N1)+r*x(1+2*N2+2*N1,1+N1));
       	x(i, j) = x1 + x2 - x3;
    end
end
%Y��ֵ
y(1,1:1:1+N1) = linspace(0, -20, 1+N1); 								   %A��B
y(1:1:1+N2, 1+N1) = -20;												   %B��C
y(1+N2:1:1+N2+2*N1,1+N1) = linspace(-20, 20, 1+2*N1);				       %C��D
y(1+N2+2*N1:1:1+2*N2+2*N1, 1+N1) = 20;									   %D��E
y(1+2*N2+2*N1, 1+N1:-1:1) = linspace(20, 0, 1+N1);                         %E��F
y(1+2*N2+2*N1:-1:1+2*N2+2*N1-M, 1) = 0;                                    %F��G
y(1+2*N2+2*N1-M:-1:1+M, 1) = [f(linspace(1,0,51)) -f(linspace(0.02,1,50))];%G��H
y(1+M:-1:1, 1) = 0;												           %H��A
%��Y�� TFI ��ʼ��
for i = 2:2*N2+2*N1
    for j = 2:N1
       	r = (i-1)/(2*N2+2*N1);
       	s = (j-1)/N1;
       	y1 = (1-r)*y(1,j) + r*y(1+2*N2+2*N1,j);
       	y2 = (1-s)*y(i,1) + s*y(i,1+N1);
       	y3 = (1-s)*((1-r)*y(1,1)+r*y(1+2*N2+2*N1,1)) + s*((1-r)*y(1,1+N1)+r*y(1+2*N2+2*N1,1+N1));
       	y(i, j) = y1 + y2 - y3;
    end
end
   
%���Laplace���̣���������
a1 = zeros(1+2*N2+2*N1, 1+N1);
b1 = zeros(1+2*N2+2*N1, 1+N1);
r1 = zeros(1+2*N2+2*N1, 1+N1);
tempx = zeros(1+2*N2+2*N1, 1+N1);
tempy = zeros(1+2*N2+2*N1, 1+N1);
for i = 1:1+2*N2+2*N1
    for j = 1:1+N1
       	tempx(i, j) = x(i, j);
       	tempy(i, j) = y(i, j);
    end
end
judge = 0;
while (judge == 0)
    for i = 2:2*N2+2*N1
        for j = 2:N1
       	a1(i, j) = (x(i,j+1)/2 - x(i,j-1)/2)^2 + (y(i,j+1)/2 - y(i,j-1)/2)^2;
        b1(i, j) = (x(i+1,j) - x(i-1,j))*(x(i,j+1) - x(i,j-1))/4 + (y(i+1,j) - y(i-1,j))*(y(i,j+1) - y(i,j-1))/4;
       	r1(i, j) = (x(i+1,j)/2 - x(i-1,j)/2)^2 + (y(i+1,j)/2 - y(i-1,j)/2)^2;
       	cpx = -b1(i,j) * (x(i+1,j+1) + x(i-1,j-1) - x(i+1,j-1) - x(i-1,j+1))/2;
       	cpy = -b1(i,j) * (y(i+1,j+1) + y(i-1,j-1) - y(i+1,j-1) - y(i-1,j+1))/2;
       	tempx(i, j) = (a1(i,j) * (x(i-1,j) + x(i+1,j)) + r1(i,j) * (x(i,j-1) + x(i,j+1)) + cpx) / (2*a1(i,j)+2*r1(i,j));
       	tempy(i, j) = (a1(i,j) * (y(i-1,j) + y(i+1,j)) + r1(i,j) * (y(i,j-1) + y(i,j+1)) + cpy) / (2*a1(i,j)+2*r1(i,j));
        end
    end
    if max(max(abs(tempx-x)+abs(tempy-y))) < 10^-4
        judge = 1;
    end
    for i = 2:2*N2+2*N1
        for j = 2:N1
       	    x(i, j) = tempx(i, j);
       	    y(i, j) = tempy(i, j);
        end
    end
end
%��������ƽ���е���������
subplot(1,2,1);
for i = 1:1+2*N2+2*N1
    plot(x(i, :), y(i, :), '-r');
    hold on;
end
for j = 1:1+N1
    plot(x(:, j), y(:, j), '-r');
    hold on;
end
hold off;