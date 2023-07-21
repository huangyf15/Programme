!****************************************************************************
!
!  PROGRAM: line_class
!
!  PURPOSE: 线模块
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

module line_class

! inherit the public entities of point_class
use point_class 

!--- 模块数据说明 ---
! 所有数据都是私有的
private

type line
   type(point) :: p1, p2   ! 线段的两个端点
endtype line

! 重新定义new和draw
interface new 
   module procedure new_this
end interface

interface draw
   module procedure draw_this
end interface

public line,new,draw

!--- 模块子程序定义 ---
contains

   !====================================
   !  画一条线
   !====================================
   subroutine draw_this(this)
   implicit none
   type(line), intent(in):: this

   write(*,*) ' drawing line', this
   end subroutine draw_this

   !====================================
   !  产生一条线
   !====================================
   subroutine new_this(this, p1, p2)
   implicit none
   type(line), intent(out):: this      ! 需要产生的线段
   type(point), intent(in):: p1, p2    ! 线段的两个端点

   this = line(p1, p2)
   end subroutine new_this
end module line_class