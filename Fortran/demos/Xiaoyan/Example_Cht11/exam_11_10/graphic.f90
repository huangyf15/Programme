!****************************************************************************
!
!  PROGRAM: graphic_object_class
!
!  PURPOSE: �����ģ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

module graphic_object_class

! inherit the public entities of point_class and line_class
use point_class
use line_class

!--- ģ������˵�� ---
! �������ݶ���˽�е�
private

! ͼ�ζ���Ҫô�ǵ㣬Ҫô����
type graphic_object
   type(point), pointer :: pp
   type(line), pointer  :: lp
endtype graphic_object

!--- ģ���ӳ���˵�� ---
interface create_graphic_object
   module procedure create_point, create_line
end interface

public graphic_object, create_graphic_object, point, line, new, &
       draw_graphic_object

!--- ģ���ӳ����壨�ɴ˿���ʵ�ֶ�̬�󶨣�---
contains

   !====================================
   !  ����һ�����ͼ�ζ���
   !====================================
   subroutine create_point(this, p)
   implicit none
   type(graphic_object), intent(out):: this  ! ��Ҫ�������ͼ�ζ���
   type(point), target, intent(in)  :: p

   this%pp => p
   nullify(this%lp)
   end subroutine create_point

   !====================================
   !  ����һ���߸�ͼ�ζ���
   !====================================
   subroutine create_line(this, l)
   implicit none
   type(graphic_object), intent(out):: this  ! ��Ҫ�����ߵ�ͼ�ζ���
   type(line), target, intent(in)   :: l

   nullify(this%pp)
   this%lp => l
   end subroutine create_line

   !====================================
   !  ����ͼ�ζ���
   !====================================
   subroutine draw_graphic_object(this)
   implicit none
   type(graphic_object), intent(in):: this

   ! ��̬�󶨣����õ���ͬһ������
   if(associated(this%pp))then
      call draw(this%pp)         
   elseif(associated(this%lp))then
      call draw(this%lp)
   endif
   end subroutine draw_graphic_object
end module graphic_object_class