!****************************************************************************
!
!  PROGRAM: circle
!
!  PURPOSE: 模块定义示例——圆模块
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************
module circle
implicit none

!--- 模块数据说明 ---
real(4), parameter::   pi = 3.1415926
real(4), allocatable:: radius(:)       ! 圆半径
integer(4) n                           ! 圆的个数

!--- 模块子程序定义 ---
contains

   !====================================
   !  产生半径的值
   !====================================
   subroutine create_radius(number)
   implicit none
   integer(4), intent(in):: number  ! 输入半径的个数
   integer(4) err                   ! 错误变量

   ! Allocate space for radius
   n = number
   allocate(radius(n), stat = err)
   if(err .ne. 0) stop 'Fail to allocate space for radius!'
 
   ! Generate radii at random
   call random_number(radius)

   end subroutine

   !====================================
   !  删除半径数组
   !====================================
   subroutine delete_radius

   deallocate(radius)

   end subroutine

   !====================================
   !  计算圆面积
   !====================================
   real(4) function area(r)
   implicit none
   real(4), intent(in):: r    ! 圆半径

   area = pi * r * r

   end function

end module

