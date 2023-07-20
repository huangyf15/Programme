!****************************************************************************
!
!  PROGRAM: exam_15_1
!
!  PURPOSE: L2 Cache������
!  
!  PROGRAMMER: ��־��
!
!  DATE:      May 29, 2006
!  MODIFIED: June 12, 2007
!            June 10, 2010
!****************************************************************************

	program exam_15_1

	implicit none

	! ��������
   integer(4), parameter :: kbyte = 256         !  1K Bytes������
   integer(4), parameter :: mbyte = 262144      !  1M Bytes������
   integer(4), parameter :: m30   = mbyte * 30  ! 30M Bytes������
   real(4)    start              ! ��¼��ʼʱ��
   real(4)    rand               ! �����
   integer(4) s
   integer(4) i, j, k            ! ѭ������
   integer(4) a(1:m30)           ! 30M Bytes����������
   integer(4) b(1:mbyte)         !  1M Bytes����������
   integer(4) c(30,kbyte,kbyte)  ! 30M Bytes����������

!--- ����30M Bytes������������鸳ֵ������¼�ķѵ�ʱ��  ---
   call random_seed()

   ! �����С����6M��L2 Cache��������CPU���죩
   start = secnds(0.0)
	do i = 1, m30
      call random_number(rand)
      a(rand * (m30-1)+1) = i
   enddo
   print *, 'Time a: ', secnds(0.0) - start

   ! �����С������6M��L2 Cache��������CPU���죩
   start = secnds(0.0)
   do j = 1, 30
	   do i = 1, mbyte
         call random_number(rand)
         b(rand * (mbyte-1)+1) = i
      enddo
   enddo
   print *, 'Time b: ', secnds(0.0) - start
   print *

!--- �ò�ͬ���㷨������Ԫ�صĺͣ�����¼�ķѵ�ʱ��  ---
   ! �����С����6M��L2 Cache��������CPU���죩
   s     = 0
   start = secnds(0.0)
	do i = 1, 30
      do j = 1, kbyte
         do k = 1, kbyte
            s = s + c(i,j,k)
         enddo
      enddo
   enddo
   print *, 'Time c1: ', secnds(0.0) - start   
   print *

   ! �����С������6M��L2 Cache��������CPU���죩
   s     = 0
   start = secnds(0.0)
	do k = 1, kbyte
      do j = 1, kbyte
         do i = 1, 30
            s = s + c(i,j,k)
         enddo
      enddo
   enddo
   print *, 'Time c2: ', secnds(0.0) - start
   print *

   ! �ڲ������������Ż�
   start = secnds(0.0)
   s     = sum(c)
   print *, 'Time c3: ', secnds(0.0) - start

 	end program exam_15_1

