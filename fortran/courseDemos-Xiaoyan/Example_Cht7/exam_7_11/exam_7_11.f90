!****************************************************************************
!
!  PROGRAM: exam_7_11
!
!  PURPOSE: ���������㷨
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March 28, 2006
!  MODIFIED: April 10, 2007
!            April  9, 2010
!****************************************************************************


	program exam_7_11

	implicit none

	! ��������
   integer(4)                n         ! ���е�Ԫ�ظ���
   integer(4)                err       ! �ڴ�ռ����״̬
   integer(4)                i, j      ! ѭ������
   integer(4)                temp      ! ��ʱ���������ڽ�������
   integer(4), allocatable:: item(:)   ! ��������
   real(4), allocatable::    item_r(:) ! ʵ������

!--- ���������Сn����������ռ� ---
   print "('�����������С: '\)"
   read *, n

   allocate(item(n), item_r(n), stat = err)
   if(err .ne. 0) stop 'Allocate error'

!--- �������n��1-100֮������� ---
   ! �������е�ʱ�̲�����������ӣ�ÿһ����������ʱֻ��Ҫ����һ�Σ����ܷ�������
   call random_seed()

   ! ����n��[0,1)֮������ʵ��
   call random_number(item_r)

   ! ��n��[0,1)֮���ʵ��ת����[0,100)֮�������
   item = int(item_r * 100.0)

   print 10, 0, item

!--- ����С�����˳���������㷨�������� ---
   ! һ������n-1������
   do i = n, 2, -1
      ! ÿ�����򽫴������ƣ���������������
      do j = 1, i - 1
         if(item(j) .gt. item(j + 1)) then
            temp        = item(j + 1)
            item(j + 1) = item(j)
            item(j)     = temp
         endif
      enddo

      ! ��ӡ��ÿһ��������״̬
      print 10, n - i + 1, item 
   enddo

10 format(/'��', i0, '��:', <n>i4)

	end program exam_7_11

