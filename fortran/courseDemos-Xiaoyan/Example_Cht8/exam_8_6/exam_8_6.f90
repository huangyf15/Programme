!****************************************************************************
!
!  PROGRAM: exam_8_6
!
!  PURPOSE: 形参与实参关系示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April  4, 2006
!  MODIFIED: April 22, 2010
!****************************************************************************

	program exam_8_6

	implicit none

   ! 形参有optional属性的函数必须用interface声明
   interface
      subroutine sub2(arg1, arg2, arg3, arg4)
      
      implicit none
      integer(4), intent(in)           :: arg1
      integer(4), intent(out), optional:: arg2
      integer(4), intent(inout)        :: arg3
      integer(4), intent(out), optional:: arg4
     
      end subroutine
   end interface

	! 变量定义
   integer(4):: a = 1, b = 2, c = 3, d = 4
   real(4)   :: e = 1.0_4

!--- 注意形参和实参的对应关系 --- 
   print *, 'Original data:'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d
   print *

   ! Fortran的参数是引用传递的
   call sub1(a, b, c, d)    ! Try to replace a with a constant or a real.
   print *, 'Call sub1:'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d
   print *

   ! 省略最后一个参数
   call sub2(1, b, c)
   print *, 'Call sub2(1):'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d
   print *

   ! 用变元关键字指定参数
   call sub2(1, arg3 = c)
   print *, 'Call sub2(2):'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d

	end program exam_8_6

!====================================
! 函数返回后参数值会改变
!====================================
   subroutine sub1(arg1, arg2, arg3, arg4)
   implicit none
   integer(4)  arg1, arg2, arg3, arg4

   arg1 = arg1 * 2

   arg2 = arg2 * 2

   arg3 = arg3 * 2

   arg4 = arg4 * 2

   end

!====================================
! 应该明确说明每个参数的输入输出属性
!====================================
   subroutine sub2(arg1, arg2, arg3, arg4)
   implicit none
   integer(4), intent(in)           :: arg1
   integer(4), intent(out), optional:: arg2
   integer(4), intent(inout)        :: arg3
   integer(4), intent(out), optional:: arg4


!   arg1 = arg1 * 2     !  arg1 is unused, this is not preferable.

   if(present(arg2)) arg2 = arg2 * 2      !  if(present(arg2))

   arg3 = arg3 * 2

   if(present(arg4)) arg4 = arg4 * 2      !  if(present(arg4))

   end