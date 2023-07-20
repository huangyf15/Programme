!****************************************************************************
!
!  PROGRAM: exam_8_6
!
!  PURPOSE: �β���ʵ�ι�ϵʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April  4, 2006
!  MODIFIED: April 22, 2010
!****************************************************************************

	program exam_8_6

	implicit none

   ! �β���optional���Եĺ���������interface����
   interface
      subroutine sub2(arg1, arg2, arg3, arg4)
      
      implicit none
      integer(4), intent(in)           :: arg1
      integer(4), intent(out), optional:: arg2
      integer(4), intent(inout)        :: arg3
      integer(4), intent(out), optional:: arg4
     
      end subroutine
   end interface

	! ��������
   integer(4):: a = 1, b = 2, c = 3, d = 4
   real(4)   :: e = 1.0_4

!--- ע���βκ�ʵ�εĶ�Ӧ��ϵ --- 
   print *, 'Original data:'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d
   print *

   ! Fortran�Ĳ��������ô��ݵ�
   call sub1(a, b, c, d)    ! Try to replace a with a constant or a real.
   print *, 'Call sub1:'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d
   print *

   ! ʡ�����һ������
   call sub2(1, b, c)
   print *, 'Call sub2(1):'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d
   print *

   ! �ñ�Ԫ�ؼ���ָ������
   call sub2(1, arg3 = c)
   print *, 'Call sub2(2):'
   print *, 'a = ', a, ' b = ', b, ' c = ', c, ' d = ', d

	end program exam_8_6

!====================================
! �������غ����ֵ��ı�
!====================================
   subroutine sub1(arg1, arg2, arg3, arg4)
   implicit none
   integer(4)  arg1, arg2, arg3, arg4

   arg1 = arg1 * 2

   arg2 = arg2 * 2

   arg3 = arg3 * 2

   arg4 = arg4 * 2

   end

!====================================
! Ӧ����ȷ˵��ÿ�������������������
!====================================
   subroutine sub2(arg1, arg2, arg3, arg4)
   implicit none
   integer(4), intent(in)           :: arg1
   integer(4), intent(out), optional:: arg2
   integer(4), intent(inout)        :: arg3
   integer(4), intent(out), optional:: arg4


!   arg1 = arg1 * 2     !  arg1 is unused, this is not preferable.

   if(present(arg2)) arg2 = arg2 * 2      !  if(present(arg2))

   arg3 = arg3 * 2

   if(present(arg4)) arg4 = arg4 * 2      !  if(present(arg4))

   end