!****************************************************************************
!
!  PROGRAM: exam_8_9
!
!  PURPOSE: 自动数组作为形参
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_9

	implicit none

	! 变量定义
   integer(4) i

!--- 产生并打印自动数组中的元素 ---
   do i = 1, 2
   	call mul(i,i + 1)
      print *
   enddo

	end program exam_8_9

!====================================
! 自动数组的大小是由输入参数决定的，
! 所需的内存空间在子程序运行时临时分
! 配，子程序结束时，该内存被释放
!====================================
   subroutine mul(m, n)
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