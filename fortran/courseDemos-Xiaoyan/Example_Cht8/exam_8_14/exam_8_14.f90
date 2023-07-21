!****************************************************************************
!
!  PROGRAM: exam_8_14
!
!  PURPOSE: �ӳ�����Ϊ�β�
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 10, 2006
!  MODIFIED: April 17, 2007
!            Nov.  25, 2010
!            April 19, 2013
!****************************************************************************

	program exam_8_14

	implicit none

!--- ����ʵ���ӳ��� ---
   ! �û�������ӳ�������Ϊ�ⲿ�ģ����ܹ���Ϊʵ��
   integer(4), external:: add
   external  wrt

   ! ϵͳ�ӳ�������Ϊ�ڲ��ģ����ܹ���Ϊʵ��
   intrinsic mod

!--- �ӳ�����Ϊʵ�� ---
   call prn(1, 2, wrt, add)

   call prn(1, 2, wrt, mod)

	end program exam_8_14

!====================================
! �����βα����������������г����β�
! ����˵�������Ǳ�����
!====================================
   subroutine prn(a, b, sub, fun)
   implicit none
   
   interface
      integer(4) function xfun(a, fun)
      integer(4), intent(in) :: a(:)
      integer(4), external:: fun ! ��������Ϊexternal���ܱ�prn�����е�xfun��ʹ��
      ! integer(4) fun
      end
   end interface

   integer(4), intent(in) :: a, b
   integer(4), external:: fun       ! ��Ϊxfun��ʵ�Σ�����Ҳ������external
   integer(4) :: array(2) = [3, 4]

   call sub(a, b)    ! ��Ϊ����Ҫ��sub��Ϊʵ�δ��ݸ������ӳ������Բ�������Ϊexternal

   write(*,*) 'result(fun) = ', fun(a, b)
   print *

   write(*,*) 'result(:)   = ', xfun(array,fun)

   end

!====================================
! �����Լ����������г�����Ϊʵ�Σ���
! Ҫ��������������Ϊ�ⲿ�ģ�external��
!====================================
   subroutine wrt(a, b)
	implicit none
	integer(4), intent(in):: a, b

	write(*,*) 'a = ', a, ' b = ', b
   
   end subroutine wrt

!====================================
! �����Լ����庯����Ϊʵ�Σ���Ҫ����
! ����������Ϊ�ⲿ�ģ�external��
!====================================
   integer(4) function add(a, b)
   integer(4), intent(in) :: a, b

   add = a + b

   end

!====================================
! �����Լ����庯����Ϊʵ�Σ���Ҫ����
! ����������Ϊ�ⲿ�ģ�external��
!====================================
   integer(4) function xfun(a, fun)
   integer(4), intent(in) :: a(:)
   integer(4) fun ! ��Ϊ����Ҫ��fun��Ϊʵ�δ��ݸ������ӳ������Բ�������Ϊexternal

   xfun = fun(a(1), a(2))

   end