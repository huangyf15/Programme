!****************************************************************************
!
!  PROGRAM: exam_7_3
!
!  PURPOSE: ������������
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_3

	implicit none

	! ��������
   integer(4)  i, j
   integer(4)  a(3)
   integer(4)  b(2,3)   

!--- ������Ԫ��������� ---
   do i = 1, 3
      read *, a(i)
   enddo
   
   print *
   do i = 1, 3          ! 4 ����Խ�磨release����飩
     print *, a(i)
   enddo

!--- ������doѭ������������� ---
   read *, (a(i), i = 1, 3)
   print *
   print *, (a(i), i = 1, 3)

!--- ��������������� ---
   read *, a
   print *
   print *, a

!--- ���ַ�ʽ�Ļ�� ---
   read *, ((b(i,j), j = 1, 3), i = 1, 2)
   print *
   print *, b
   
   print *
   do i = 1, 2
      print *, b(i,:)
   enddo

	end program exam_7_3

