!===================================================
!  PURPOSE: 说明外部子例行程序可以放在一个单独的文件
!           里用递归实现阶乘操作
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April  3, 2006
!  MODIFIED: April  8, 2008
!            April 14, 2010
!===================================================
recursive integer(4) function factorial(x)  !result(f)
implicit none
integer(4) x

if(x .eq. 1) then
   factorial = 1
   
   !f = 1                      ! 用了result语句时采用这种方式
else   
   factorial = x * factorial(x - 1)
   
   !f = x * factorial(x - 1)   ! 用了result语句时采用这种方式
end if

! 如果递归函数的返回值是数组，则必须用result
end function
