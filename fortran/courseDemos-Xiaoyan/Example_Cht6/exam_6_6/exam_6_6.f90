!****************************************************************************
!
!  PROGRAM: exam_6_6
!
!  PURPOSE: ������ֽ����ʾ�� 
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 12, 2006
!****************************************************************************

	program exam_6_6
   
	implicit none

	! ��������
   integer(4) i

! Check "Project/Settings/Fortran/Compatibility/PowerStation4.0 Compatibility/
!        Other Run-time Behaviour"
   ! �ո��Ƶ���һ�п�ͷ
	write(*,10) 123
10 format(1x, i3)

	write(*,20) 123
20 format(' ',i3)

   ! 0���Ƶ������п�ͷ
	write(*,30) 123
30 format('0',i3)

	write(*,40) '023'
40 format(a)

   ! +���Ƶ���ǰ�п�ͷ
   print *
   print *
   do i = 1, 10
      write(*,50) i
      call sleepqq(1000)   !��ʱ1�롣 Visual Fortran �ڲ��������Ǳ�׼
   enddo
50 format('+', 'i = ', i2)
!50 format( 'i = ', i2)


	end program exam_6_6

