!****************************************************************************
!
!  PROGRAM: exam_15_3
!
!  PURPOSE: Hoistingʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 29, 2006
!****************************************************************************

	program exam_15_3

	implicit none

	! ��������
   integer(4) i, j   ! ѭ������
   integer(4) k      ! ��������

!--- ��Ҫhoisting����� ---
	do i = 1, 100
      do j = 1, 100
         k = i * 2            ! �����Ӧ�÷�����һ��ѭ����
         print *, j * k
      enddo
   enddo

   do i = 1, 100
      do j = 1, 100
         if(i .gt. 20) then   ! ���ж�Ӧ�÷�����һ��ѭ����
            k = j * 2
         else
            k = j * 3
         endif
      enddo
   enddo
      
	end program exam_15_3

