!****************************************************************************
!
!  PROGRAM: exam_4_3
!
!  PURPOSE: 常量示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 1, 2006
!  
!  MODIFIED: March  6, 2007
!            March  4, 2008
!            March 12, 2010
!            June  15, 2010
!****************************************************************************

	program exam_4_3

	implicit none
   character*2 st

   !整型(可为2～36进制，缺省为十进制，只有#符号时为16进制)
   print *, 1, 2#101, -8#71, #FF, +17#G
   print *

   print *, 128_1, 128_2, 513_1            ! 注意整数的表示范围
   print *

   !实型—小数形式
   print *, 0.233, -3., .2_4, +.2_8 ! 注意小数的有效位数
   print * 


   !实型—指数形式
   print *, 0.2e-3, 0.2d-3, -1e2_4, .3E3_8  !, .3D3_8   ! 指数形式用kind时，只能用E，不能用D
   print *

   !复型
   print *, (2,#F), (3.,-1.), (5.1e-2, 4.8e3_8)
   print *

	!字符型——一般字符串
   print *, 'Programming', " is fun!"

   !字符型——H字符串（老FORTRAN中常用，Fortran90中废除）
   print *, 19HProgramming is fun!

   !字符型——C字符串（允许出现特殊的非打印字符）
	print *, '\a'c, '\A'c, '\a'C

   print *, 'abc\bdef'c

   print *, 'abc\tdef'c

   print *, 'abc\rde'c

   print *, 'abc\\def'c

   print *, 'abc\110def'c

   print *, len('abc\bdef'c)  ! C字符串的末尾自动添加NULL，所以长度会计算NULL

   st = 'c'c         ! 查看内存（使用断点调试+Disassembly）

   print *, st

   print *, char(0)  ! NULL

   print *

   !逻辑型
   print *, .true., .false.

	end program exam_4_3

