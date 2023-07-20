function c = getcolor(x, y)
%{
  PROGRAM: getcolor
  PURPOSE: 根据初值点x+yi，用牛顿法解方程。根据其解来给该点赋予不同的颜色  
  PROGRAMMER: 向志海
  DATE: Dec 18, 2010
%}

% 得到用复数表示的初值点
p = complex(x,y); 

% 用牛顿法求解方程x^3 - 1 = 0
while(abs(p^3 - 1) > 1e-2)
    p = p - (p^3 - 1) / 3 / p^2;
end

% 根据最后收敛到的解，赋予不同的颜色
c = uint8(1);   % 收敛到1时，是红色号
if (imag(p) < -0.5)
    c = uint8(2);   % 收敛到-1/2 - sqrt(3)/2 i时，是绿色号
elseif (imag(p) > 0.5)
    c = uint8(3);   % 收敛到-1/2 + sqrt(3)/2 i时，是蓝色号
end
        
        


