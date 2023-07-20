!****************************************************************************
!
!  PROGRAM: circle
!
!  PURPOSE: ģ�鶨��ʾ������Բģ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************
module circle
implicit none

!--- ģ������˵�� ---
real(4), parameter::   pi = 3.1415926
real(4), allocatable:: radius(:)       ! Բ�뾶
integer(4) n                           ! Բ�ĸ���

!--- ģ���ӳ����� ---
contains

   !====================================
   !  �����뾶��ֵ
   !====================================
   subroutine create_radius(number)
   implicit none
   integer(4), intent(in):: number  ! ����뾶�ĸ���
   integer(4) err                   ! �������

   ! Allocate space for radius
   n = number
   allocate(radius(n), stat = err)
   if(err .ne. 0) stop 'Fail to allocate space for radius!'
 
   ! Generate radii at random
   call random_number(radius)

   end subroutine

   !====================================
   !  ɾ���뾶����
   !====================================
   subroutine delete_radius

   deallocate(radius)

   end subroutine

   !====================================
   !  ����Բ���
   !====================================
   real(4) function area(r)
   implicit none
   real(4), intent(in):: r    ! Բ�뾶

   area = pi * r * r

   end function

end module

