!****************************************************************************
!
!  PROGRAM: exam_6_2
!
!  PURPOSE: ��ʽ��ʽ�����ֱ�﷽ʽ 
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 12, 2006
!****************************************************************************

	program exam_6_2

	implicit none

	! ��������
   integer(4)::    i   = 1
   character(20):: out = "(1x, 'i = ', i3)"

	! ��ظ�ʽ
   print *, i + 2
   print *

   write(*,*) i + 2
   write(*,*)

   ! ��ʽ��ʽ
   write(*,10) i + 2                      ! ��Ĭ��λ��
   write(*,*)
10 format(1x, 'i = ', i3)

   write(fmt = 10, unit = *) i + 2        ! λ�ÿ�����ʽָ��
   write(*,*)

   write(*, "(1x, 'i = ', i3)") i + 2     ! ����һ�ֱ�ʾ��ʽ
   write(*,*)

   write(fmt = '(1x, "i = ", i3)', unit = 6) i + 2
   write(*,*)

   write(*, '()')                         ! �������

   write(*, out) i + 2                    ! ����Ҳ������Ϊ��ʽ

	end program exam_6_2

