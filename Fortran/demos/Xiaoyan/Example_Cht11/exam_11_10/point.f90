!****************************************************************************
!
!  PROGRAM: point_class
!
!  PURPOSE: ��ģ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

module point_class

!--- ģ������˵�� ---
! �������ݶ���˽�е�
private

type point
   real :: x, y ! coordinates of the point
endtype point

!--- ģ���ӳ���˵�� --- 
interface new
   module procedure new_this
end interface

interface draw
   module procedure draw_this
end interface

public point, new, draw

!--- ģ���ӳ����� ---
contains

   !====================================
   !  ��һ����
   !====================================
   subroutine draw_this(this)
   implicit none
   type(point), intent(in):: this

   write(*,*) ' drawing point at', this%x, this%y
   end subroutine draw_this

   !====================================
   !  ����һ����
   !====================================
   subroutine new_this(this, x, y)
   implicit none
   type(point), intent(out):: this  ! ��Ҫ�����ĵ�
   real, intent(in)        :: x, y  ! ���ƽ������

   this = point(x, y)
   end subroutine new_this
end module point_class