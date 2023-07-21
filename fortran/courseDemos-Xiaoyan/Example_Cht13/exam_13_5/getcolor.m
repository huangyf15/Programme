function c = getcolor(x, y)
%{
  PROGRAM: getcolor
  PURPOSE: ���ݳ�ֵ��x+yi����ţ�ٷ��ⷽ�̡�������������õ㸳�費ͬ����ɫ  
  PROGRAMMER: ��־��
  DATE: Dec 18, 2010
%}

% �õ��ø�����ʾ�ĳ�ֵ��
p = complex(x,y); 

% ��ţ�ٷ���ⷽ��x^3 - 1 = 0
while(abs(p^3 - 1) > 1e-2)
    p = p - (p^3 - 1) / 3 / p^2;
end

% ��������������Ľ⣬���費ͬ����ɫ
c = uint8(1);   % ������1ʱ���Ǻ�ɫ��
if (imag(p) < -0.5)
    c = uint8(2);   % ������-1/2 - sqrt(3)/2 iʱ������ɫ��
elseif (imag(p) > 0.5)
    c = uint8(3);   % ������-1/2 + sqrt(3)/2 iʱ������ɫ��
end
        
        


