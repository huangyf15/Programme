!****************************************************************************
!
!  PROGRAM: circle
!
!  PURPOSE: 数据封装示例——圆模块
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************
module circles
implicit none

!--- 模块数据说明 ---
! 所有数据都是私有的
private

! point类型以及其成员对外是私有的
type:: point
   real :: x, y            ! 点的平面坐标
end type point

! circle类型对外是公共的，但其成员对外是私有的
type, public:: circle
   private
   type(point) :: centre   ! 圆心
   real :: radius          ! 半径
end type circle

!--- 模块子程序说明（overloading） ---
interface operator (.crosses.)
   module procedure circle_crosses
end interface

! 使外部程序可以使用这两个模块子程序
public operator (.crosses.), create_circle

!--- 模块子程序定义 ---
contains

   !====================================
   !  产生圆
   !====================================
   subroutine create_circle(c, x1, y1, r)
   implicit none
   type(circle), intent(out):: c       ! 需要产生的圆
   real, intent(in)         :: x1, y1  ! 圆心坐标
   real, intent(in)         :: r       ! 圆半径

   ! 产生一个圆
   c = circle(point(x1,y1), r)

   end subroutine

   !====================================
   !  判断两个圆是否相交
   !====================================
   logical function circle_crosses(c1, c2)
   implicit none
   type(circle), intent(in) :: c1, c2  ! 输入两个圆
   real                     :: d       ! 两个圆心的距离平方

   ! 计算两个圆心距离的平方
   d = (c1%centre%x - c2%centre%x)**2 + (c1%centre%y - c2%centre%y)**2

   ! 判断两个圆是否相交
   if( d .lt. (c1%radius + c2%radius)**2 .and. &
       d .gt. (c1%radius - c2%radius)**2 ) then
      circle_crosses = .true.
   else
      circle_crosses = .false.
   end if
   
   end function circle_crosses
end module circles