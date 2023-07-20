!****************************************************************************
!
!  PROGRAM: exam_7_12
!
!  PURPOSE: ��ѡ�������㷨
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March 28, 2006
!  MODIFIED: April 10, 2007
!            April  9, 2010
!****************************************************************************


	program exam_7_12

	implicit none

	! ��������
   integer(4)                n         ! ���е�Ԫ�ظ���
   integer(4)                err       ! �ڴ�ռ����״̬
   integer(4)                i, j      ! ѭ������
   integer(4)                index     ! ���ڼ�¼ѡ�����Ԫ�ص�λ��
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

!--- ����С�����˳���ü�ѡ���㷨�������� ---
   ! һ������n-1������
   do i = 1, n - 1
      index = i

      ! ѡ��ʣ��Ԫ����ֵ��С��Ԫ��
      do j = i + 1, n
         if(item(index) .gt. item(j)) index = j
      enddo

      ! ����С��Ԫ�ؽ�����ǰ��
      if(i .ne. index) then
         temp        = item(index)
         item(index) = item(i)
         item(i)     = temp
      endif

      ! ��ӡ��ÿһ��������״̬
      print 10, i, item 
   enddo

10 format(/'��', i0, '��:', <n>i4)
	
	end program exam_7_12

