!****************************************************************************
!
!  PROGRAM: exam_8_10
!
!  PURPOSE: 可调数组作为形参
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_10

	implicit none

	! 变量定义
   integer(4) a(6), b(6)
   integer(4) i

!--- 产生并打印可调数组中的元素 ---
   do i = 1, 2
   	call mul(a, b, i, i + 1)
      print *
   enddo	

	end program exam_8_10

!====================================
! 可调数组的大小是由输入参数决定的，
! 所需的内存空间是形参数组名代表的
! 内存空间，子程序结束时，该内存仍然
! 保留
!====================================
   subroutine mul(a, b, m, n)
   implicit none
   integer(4), intent(in):: m, n
   integer(4) a(m,n), b(n,m), c(m,m)
   integer(4) i, j

   a = m
   b = n
   c = matmul(a,b)
   c = c * c
   do i = 1, m
      print *, (c(i,j), j = 1, m)
   enddo

   end