!****************************************************************************
!
!  PROGRAM: circle
!
!  PURPOSE: ���ݷ�װʾ������Բģ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************
module circles
implicit none

!--- ģ������˵�� ---
! �������ݶ���˽�е�
private

! point�����Լ����Ա������˽�е�
type:: point
   real :: x, y            ! ���ƽ������
end type point

! circle���Ͷ����ǹ����ģ������Ա������˽�е�
type, public:: circle
   private
   type(point) :: centre   ! Բ��
   real :: radius          ! �뾶
end type circle

!--- ģ���ӳ���˵����overloading�� ---
interface operator (.crosses.)
   module procedure circle_crosses
end interface

! ʹ�ⲿ�������ʹ��������ģ���ӳ���
public operator (.crosses.), create_circle

!--- ģ���ӳ����� ---
contains

   !====================================
   !  ����Բ
   !====================================
   subroutine create_circle(c, x1, y1, r)
   implicit none
   type(circle), intent(out):: c       ! ��Ҫ������Բ
   real, intent(in)         :: x1, y1  ! Բ������
   real, intent(in)         :: r       ! Բ�뾶

   ! ����һ��Բ
   c = circle(point(x1,y1), r)

   end subroutine

   !====================================
   !  �ж�����Բ�Ƿ��ཻ
   !====================================
   logical function circle_crosses(c1, c2)
   implicit none
   type(circle), intent(in) :: c1, c2  ! ��������Բ
   real                     :: d       ! ����Բ�ĵľ���ƽ��

   ! ��������Բ�ľ����ƽ��
   d = (c1%centre%x - c2%centre%x)**2 + (c1%centre%y - c2%centre%y)**2

   ! �ж�����Բ�Ƿ��ཻ
   if( d .lt. (c1%radius + c2%radius)**2 .and. &
       d .gt. (c1%radius - c2%radius)**2 ) then
      circle_crosses = .true.
   else
      circle_crosses = .false.
   end if
   
   end function circle_crosses
end module circles