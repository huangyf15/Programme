!****************************************************************************
!
!  PROGRAM: exam_8_19
!
!  PURPOSE: ��ֵ������
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 11, 2006
!****************************************************************************

	program exam_8_19

	implicit none

   ! ����'='�Զ����µ�ת������ע���������һ��Ҫһ��
   interface assignment(=)
      subroutine log_to_int(i, l)
      implicit none
!     logical(1), intent(in):: l
      logical, intent(in):: l
      integer(4), intent(out):: i
      end
   end interface

	! ��������
   integer(4) i

!--- ���߼�����ת������������ ---
	i = .true.
   print *, i

   i = .false.
   print *, i

	end program exam_8_19

!====================================
! ���߼�����ת������������
!====================================
   subroutine log_to_int(i, l)
   implicit none
 !  logical(1), intent(in):: l
   logical, intent(in):: l
   integer(4), intent(out):: i

   i = 0
   if(l) i = 1

   end

