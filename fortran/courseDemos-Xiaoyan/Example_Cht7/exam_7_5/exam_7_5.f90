
!****************************************************************************
!
!  PROGRAM: exam_7_5
!
!  PURPOSE: ��ѯ�������Եĺ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_5

   implicit none

   ! ��������
   integer(4)  a(-1:2, 2:4)

!--- ���ֲ�ѯ���� ---
   ! ����ÿһά���½�
   print *, 'lbound(a): ', lbound(a)

   ! ����ÿһά���Ͻ�
   print *, 'ubound(a): ', ubound(a)

   ! ����ÿһά�Ĵ�С
   print *, 'shape(a) : ', shape(a)

   ! ����Ԫ�صĸ���
   print *, 'size(a)  : ', size(a)

   ! ����ռ�õ��ֽ���
   print *, 'sizeof(a): ', sizeof(a)

	end program exam_7_5

