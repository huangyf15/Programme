!****************************************************************************
!
!  PROGRAM: exam_11_4
!
!  PURPOSE: �ȼ����ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!        May 21, 2014 by Xiaoyan Li
!****************************************************************************

	program exam_11_4

	implicit none

!--- �������� ---
   integer(4)   a, b, i
   real(8)      c, d(3), e(2)
   real(8)      f(2)
   character(4) ch

   equivalence (a, c, i, ch), (d, e)

   !equivalence (d(1), e(1)), (d(1), e(2))    ! ì�ܵĵȼ۹�ϵ

   !equivalence (e(1), f(1)), (e(2), f(2))    ! ���������Ĵ洢�ռ�

!--- ��������ֵ��ע��ȼ۱���ֵ�ı仯�� ---
	a  = 1
	ch = 'aaaa'
	print *, ch

	do i=1,3
		d(i)=dble(i-1)		
	end do
	print *, d

	do i=1,2
		e(i)=dble(i+1)		
	end do
	print *, e

	print *, d

	end program exam_11_4

