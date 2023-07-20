!****************************************************************************
!
!  PROGRAM: exam_8_2
!
!  PURPOSE: 外部子例行程序示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 3, 2006
!  MODIFIED: April 8, 2008
!****************************************************************************

!====================================
! 外部子例行程序的声明可以放在主程序前
!====================================
   subroutine sum_mul(vector, n, sum, mul)
   ! 变量定义
   implicit none
   integer(4)  n, vector(n)  ! 输入变量，注意这种假设大小数组的声明方式
   integer(4)  sum, mul      ! 输出变量
   integer(4)  i             ! 工作变量

!--- 求和、求积 ---
   sum = 0
   mul = 1
   do i = 1, n
      sum = sum + vector(i)
      mul = mul * vector(i)
   enddo

   print *, 'sum_mul terminated!'
   print *

   end

!====================================
! 主程序
!====================================
	program exam_8_2

	implicit none

	! 变量定义
   integer(4):: a(4) = [1:4], sum, mul

!--- 调用子例行程序 ---
	call sum_mul(a, size(a), sum, mul)
   print *, 'sum = ', sum, ' mul = ', mul
   
   ! 没有参数时可以省略括号，call已经表明这是一个子例行程序
   call banner

   ! 调用一个递归子例行程序。link时只要在project中能找到相应的obj文件即可
   call factorial(5, mul)
   print *, '5! = ', mul

	end program exam_8_2

!====================================
! 外部子例行程序的声明可以放在主程序后
!====================================
   subroutine banner ! 没有参数时可以省略括号

   print *
   print *, 'Programming is fun!'
   print *

   end