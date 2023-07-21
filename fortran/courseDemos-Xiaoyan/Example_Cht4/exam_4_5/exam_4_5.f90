!****************************************************************************
!
!  PROGRAM: exam_4_5
!
!  PURPOSE: 算术表达式和赋值语句示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 1, 2006
!  MODIFIED: March 11, 2009
!  MODIFIED: March 19, 2014 by Xiaoyan Li
!****************************************************************************

   program exam_4_5

   implicit none

   ! 变量定义
   integer::    i = 3
   integer::    j = 2
   complex(4):: a = (1.5, 2.5)   ! 复数变量赋初值
   complex(4)   b
   complex(4)   c
   real(4)      length

   ! 类型转换
   print *, i / j, real(i) / j, dble(j) / i, int(real(i) / j), nint(real(i) / j),&
           
            ceiling(real(i) / j)

   print *

	! 复数表达式
   b = (4.5, 5.5)
	c = a + 0.618 * (b - a)

   print *, 'c      = ', c
   print *, 'Re(c)  = ', real(c)
   print *, 'Im(c)  = ', imag(c)
   print *, 'CG(c)  = ', conjg(c)
   print *, 'Arg(c)  = ', atan2(imag(c), real(c))

   length = abs(a - b)
   print *, 'length = ', length
   print *

   end program exam_4_5