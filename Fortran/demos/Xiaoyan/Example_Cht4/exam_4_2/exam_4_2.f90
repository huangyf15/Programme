!****************************************************************************
!
!  PROGRAM: exam_4_2
!
!  PURPOSE: ���ƹ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     Feb. 28, 2006
!  MODIFIED: Oct. 21, 2010
!****************************************************************************

	program exam_4_2

	implicit none
   integer:: $total = 1
   integer:: A_name_made_up_of_more_than_31_letters = 2
   integer aaa
   !integer:: _program = 3

   aaa=2
   print *, aaa

	! ������$��ͷ���Ǳ�׼�÷�����Compaq Visual Fortran����ʷ�йأ�
   print *, $total
   print *
	
   ! Visual Fortran �е����Ƴ��ȿɴ�63���ַ�
   print *, 'A long name:'
   print *, A_name_made_up_of_more_than_31_letters


	end program exam_4_2

