function [a, l] = area_perimeter(radius)
% PROGRAM: area_perimeter
%{
  PURPOSE: 计算圆的面积和周长 
  PROGRAMMER: 向志海
  DATE:     Dec 14, 2010
  MODIFIED: Dec 21, 2011
            Dec 15, 2013
 %}

% 检查是否有实参传递进来 (参见最新的narginchk函数)
msg = nargchk(1,1,nargin);  % nargin是实参的数目，这里要求它只能是1
error(msg);

% 检查半径是否正常
if radius <= 0
    msg = 'Radius is not positive!';
    warning(msg);
end

% 查看实参的名字
disp(['Radius name: ' inputname(1)]);

% 计算圆面积
a = pi * radius^2;

% 当有第二个输出参数时才计算圆的周长
if nargout == 2
    l = 2 * pi * radius;
end

radius = 0;   % 因为是call by value，所以不会影响主程序中的r值