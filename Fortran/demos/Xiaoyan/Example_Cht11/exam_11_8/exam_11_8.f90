!****************************************************************************
!
!  PROGRAM: exam_11_8
!
!  PURPOSE: ���ݷ�װʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_8

!--- ����ģ�� ---
   use circles

	implicit none

!--- ��������Բ���� ---
   type(circle) c1, c2

!--- ��������Բ�����ж��Ƿ��ཻ ---
   call create_circle(c1, 1.0, 2.0, 3.0)

   call create_circle(c2, 1.0, 3.0, 3.0)

   print *, 'c1 �� c2 �ཻ? ', c1 .crosses. c2
	
!   print *, c1   ! ˽�г�Ա���ɼ�

	end program exam_11_8

