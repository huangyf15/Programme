!****************************************************************************
!
!  PROGRAM: exam_10_1
!
!  PURPOSE: ָ��Ļ�������ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_10_1

	implicit none

	! ��������
   integer(4), target ::  a = 1
   integer(4), pointer::  p1, p2 => null()   ! ��ʼ��ָ��Ϊ���ա�

!--- ָ��Ĳ�ͬ״̬ ---
	print *, 'p1 associate state: ', associated(p1)
   print *, 'p2 associate state: ', associated(p2)
   print *

!-----ֻ�о��й���״̬��ָ����ܱ����ʣ���ֵ�����ã����Էǹ���״ָ̬����з��ʣ�����������

   !print *, p2   ! ��ָ�뻹δ����!!!


   ! ָ�������Ϊ����
   p1 => a
   p2 => p1    ! A pointer has intrinsic 'target' attribute

	print *, 'p1 associate state: ', associated(p1)
   print *, 'p2 associate state: ', associated(p2)
   print *, 'p2 associate a    : ', associated(p2, a)
   print *

   print *, 'p1 = ', p1, ' p2 = ', p2
   
   !a=2
   p2 = p1 * 2

   print *, 'p1 = ', p1, ' p2 = ', p2, ' a = ', a
   print *

   nullify(p1)
	print *, 'p1 associate state: ', associated(p1)
	print *, 'p2 associate state p1: ', associated(p2,p1)
	print *, 'p2 associate state a: ', associated(p2,a)

	end program exam_10_1