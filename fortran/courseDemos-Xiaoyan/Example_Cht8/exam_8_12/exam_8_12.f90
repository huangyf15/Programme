!****************************************************************************
!
!  PROGRAM: exam_8_12
!
!  PURPOSE: 假定形状的数组作为形参
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_12

	implicit none

   ! 当形参中有假定形状的数组时，子程序必须显式说明
   interface
      subroutine sub(a, b)
      implicit none
      integer(4) a(2:), b(:,:)
      end
   end interface

	! 变量定义
   integer(4) a(6), b(2,3)

!--- 给数组赋初值 ---
   a = (/1:6/)
   b = reshape((/6:1:-1/), shape(b))
	
!--- 数组元素仍然按列排列 ---
   print *, '1st call:'
   call sub(a, b)
   print *

   ! 实参数组的形状必须合法
   print *, '2nd call:'
!   call sub(b, a)	

	end program exam_8_12

!====================================================================
! 假定形状数组的所有维的大小都不定（用:表示）。所需的内存空间是形参数
! 组名代表的内存空间，子程序结束时，该内存仍然保留
!(2014.4.22加)假定形状数组与实参结合时，假定形状的数组的未知上下界由实在数组确定
!====================================================================
   subroutine sub(a, b)
   implicit none
   integer(4) a(2:), b(:,:)
   integer(4) i, j

!--- 编译程序知道假定形状数组的形状（因为子程序已经显式说明） ---
   ! 可以对数组进行整体操作
   print *, 'a:'
   print *, a
   print *

   ! 运行时知道数组的大小
   print *, (a(i), i = 2, 1 + size(a))

   ! 运行时知道数组的界
   print *
   print *, 'b:'
   do i = 1, ubound(b,1)
      print *, (b(i,j), j = 1, ubound(b,2))
   enddo

   end