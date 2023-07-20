!****************************************************************************
!
!  PROGRAM: exam_4_8
!
!  PURPOSE: �������ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March  1,   2006
!  MODIFIED: March 20,   2007
!            March 11,   2009
!            October 12, 2010
!****************************************************************************

	program exam_4_8

	implicit none

	! ��������
   real(4) x
   real(4) y
   real(4) z
   real(4) c
   real(8) d
   integer i

   ! ����ת�����
   x = 1.5        ! Assign to single precision
   d = x          ! Convert to double precision
   print *, d

   x = 1.6        ! Assign to single precision
   d = x          ! Convert to double precision
   print *, d
   print *

   ! �;���������ɵ���Ч���ֵĶ�ʧ
   d = 11111.1 * 1111.11
   print *, d

   d = 11111.1_8 * 1111.11_8
   print *, d
   print *

   ! ����˳����ɵ���Ч���ֵĶ�ʧ��������С����
   print *, 0.1 + 3257845.0 - 3257840.0
   print *, 3257845.0 - 3257840.0 + 0.1
   print *

   ! ��FPU��ص�����
   x = 10.0
   y =  3.0

   z = x / y - x / y
   print *, 'z = ', z
   print *, 'z == 0 : ', z .eq. 0.0
   print *

   c = x / y
   z = c - x / y
   print *, 'x / y = ', x / y
   print *, 'c = ', c
   print *, 'z = ', z
   print *, 'z == 0 : ', z .eq. 0.0
   print *, 'abs(z) < eps: ', abs(z) .lt. epsilon(z), ' (eps = ', epsilon(z), ')'
   print *

   ! �������P87 Ex0509.F90
   x = sqrt(y) ** 2 - y
   print *, 'x = ', x
   if(x .eq. 0.0) then
      print *, 'x == 0'
   else
      print *, 'x /= 0'
   endif
   print *

   x = sqrt(y) ** 2 - y
   print *, 'x = ', x
   if(abs(x) .lt. epsilon(x)) then
      print *, 'x == 0'
   else
      print *, 'x /= 0'
   endif

	end program exam_4_8

