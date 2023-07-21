!****************************************************************************
!
!  PROGRAM: graphic_object_class
!
!  PURPOSE: 点和线模块
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

module graphic_object_class

! inherit the public entities of point_class and line_class
use point_class
use line_class

!--- 模块数据说明 ---
! 所有数据都是私有的
private

! 图形对象要么是点，要么是线
type graphic_object
   type(point), pointer :: pp
   type(line), pointer  :: lp
endtype graphic_object

!--- 模块子程序说明 ---
interface create_graphic_object
   module procedure create_point, create_line
end interface

public graphic_object, create_graphic_object, point, line, new, &
       draw_graphic_object

!--- 模块子程序定义（由此可以实现动态绑定）---
contains

   !====================================
   !  产生一个点给图形对象
   !====================================
   subroutine create_point(this, p)
   implicit none
   type(graphic_object), intent(out):: this  ! 需要产生点的图形对象
   type(point), target, intent(in)  :: p

   this%pp => p
   nullify(this%lp)
   end subroutine create_point

   !====================================
   !  产生一条线给图形对象
   !====================================
   subroutine create_line(this, l)
   implicit none
   type(graphic_object), intent(out):: this  ! 需要产生线的图形对象
   type(line), target, intent(in)   :: l

   nullify(this%pp)
   this%lp => l
   end subroutine create_line

   !====================================
   !  画出图形对象
   !====================================
   subroutine draw_graphic_object(this)
   implicit none
   type(graphic_object), intent(in):: this

   ! 动态绑定，调用的是同一个函数
   if(associated(this%pp))then
      call draw(this%pp)         
   elseif(associated(this%lp))then
      call draw(this%lp)
   endif
   end subroutine draw_graphic_object
end module graphic_object_class