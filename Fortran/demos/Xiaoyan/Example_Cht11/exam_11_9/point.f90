!****************************************************************************
!
!  PROGRAM: point_class
!
!  PURPOSE: 点模块
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

module point_class

!--- 模块数据说明 ---
! 所有数据都是私有的
private

type point
   real :: x, y ! coordinates of the point
endtype point

!--- 模块子程序说明 --- 
interface new
   module procedure new_this
end interface

interface draw
   module procedure draw_this
end interface

public point, new, draw

!--- 模块子程序定义 ---
contains

   !====================================
   !  画一个点
   !====================================
   subroutine draw_this(this)
   implicit none
   type(point), intent(in):: this

   write(*,*) ' drawing point at', this%x, this%y
   end subroutine draw_this

   !====================================
   !  构造一个点
   !====================================
   subroutine new_this(this, x, y)
   implicit none
   type(point), intent(out):: this  ! 需要产生的点
   real, intent(in)        :: x, y  ! 点的平面坐标

   this = point(x, y)
   end subroutine new_this
end module point_class