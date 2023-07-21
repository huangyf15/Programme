!****************************************************************************
!
!  PROGRAM: line_class
!
!  PURPOSE: ��ģ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

module line_class

! inherit the public entities of point_class
use point_class 

!--- ģ������˵�� ---
! �������ݶ���˽�е�
private

type line
   type(point) :: p1, p2   ! �߶ε������˵�
endtype line

! ���¶���new��draw
interface new 
   module procedure new_this
end interface

interface draw
   module procedure draw_this
end interface

public line,new,draw

!--- ģ���ӳ����� ---
contains

   !====================================
   !  ��һ����
   !====================================
   subroutine draw_this(this)
   implicit none
   type(line), intent(in):: this

   write(*,*) ' drawing line', this
   end subroutine draw_this

   !====================================
   !  ����һ����
   !====================================
   subroutine new_this(this, p1, p2)
   implicit none
   type(line), intent(out):: this      ! ��Ҫ�������߶�
   type(point), intent(in):: p1, p2    ! �߶ε������˵�

   this = line(p1, p2)
   end subroutine new_this
end module line_class