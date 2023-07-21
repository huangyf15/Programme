!****************************************************************************
!
!  PROGRAM: exam_8_16
!
!  PURPOSE: 接口的作用
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 11, 2006
!  MODIFIED: Nov.  27, 2011
!            April 19, 2013
!****************************************************************************

	program exam_8_16

	implicit none

   ! 这样显式地通知编译程序，才能检查子程序的调用情况
   interface
      subroutine external_list(x, y)
      implicit none
      integer(4), intent(in):: x(:,:)
      real(4), intent(in)::    y(:)
      end
   end interface

	! 变量定义
   integer(4)  a(2,3)
   real(4)     b(6)

   ! 给数组赋初值
   a = reshape([1:6], shape(a))
   b = [1:6]

   ! 内部子程序是显式的，编译器会自动检查调用的合法性
   call internal_list(a, b)

   ! 外部子程序是隐式的，除非显式说明，编译器不会知道
   ! 子程序的接口，也就无法自动检查调用的合法性
   call external_list(a, b)

   contains
   !====================================
   ! 打印数组元素
   !====================================
      subroutine internal_list(x, y)
      implicit none
      integer(4), intent(in):: x(:,:)
      real(4), intent(in)::    y(:)
      integer(4) i, j

      print *, '--- Internal list ---'
      print *, 'x: '
      do i = 1, ubound(x,1)
         print *, (x(i,j), j = 1, ubound(x,2))
      enddo

      print *, 'y: ', y

      end subroutine
	end program exam_8_16
