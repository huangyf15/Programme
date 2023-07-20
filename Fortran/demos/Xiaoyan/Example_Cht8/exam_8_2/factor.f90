!===================================================
!  PURPOSE: 说明外部子例行程序可以放在一个单独的文件
!           里用递归实现阶乘操作
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 3, 2006
!  MODIFIED: April 8, 2008
!===================================================
   recursive subroutine factorial(n, f)
   implicit none
   integer(4), intent(in)::  n   !注意这里的变量属性
   integer(4), intent(out):: f
 
   integer(4) f1

   if(n .eq. 1) then
      f = 1
   else
      call factorial(n - 1, f1)
      f = n * f1
   end if
   
   end