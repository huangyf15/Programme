!****************************************************************************
!
!  PROGRAM: exam_7_13
!
!  PURPOSE: ������ͬ�෨����α����������۲���ѭ�����������ӵı仯
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April  8, 2008
!  MODIFIED: April 14, 2010
!****************************************************************************

	program exam_7_13

	implicit none

	! Variables
   integer(4), parameter:: a = 13   ! ����
   integer(4), parameter:: c = 3    ! ����������ȡΪ3, 4
   integer(4), parameter:: m = 16   ! ����
   integer(4) x   ! ����
   integer(4) i   ! ѭ������
   

	! �趨α�����������
   x = 3   ! ����ȡ����Ϊ2, 3, 4

   ! ����α��������У�a, c, m �����Ӿ�����α�����ѭ�����ڵĳ��̣�
   do i = 1, 2 * m
      x = mod(a * x + c, m)
      
      print *, i, real(x) / m
   enddo
	end program exam_7_13

