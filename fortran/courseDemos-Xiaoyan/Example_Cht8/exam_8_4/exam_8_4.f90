!****************************************************************************
!
!  PROGRAM: exam_8_4
!
!  PURPOSE: ���������㷨
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March 28, 2006
!  MODIFIED: APRIL 10, 2007
!            April  9, 2010
!****************************************************************************


	program exam_8_4

	implicit none

	! ��������
   integer(4)                n         ! ���е�Ԫ�ظ���
   integer(4)                err       ! �ڴ�ռ����״̬
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

   print 10, item
10 format(/'ԭʼ����:  ', <n>i4/)

!--- ����С�����˳���ÿ��������㷨�������� ---
   call quicksort(item, 1, n)


!================================================================================
   contains

!*** ��������ĵݹ���� ***
   recursive subroutine quicksort(item, s, t)
   implicit none
   integer(4), intent(inout):: item(:)    ! �������У��������ʱ�Ѱ���С�����˳���������
   integer(4), intent(in)::    s, t       ! �ֱ�Ϊ�������е���ʼ�������±�
   integer(4)                  k          ! ������±�

   if(s .lt. t) then
      call quickpass(item, s, t, k)
      
      call quicksort(item, s, k - 1)

      call quicksort(item, k + 1, t)

   endif

   end subroutine

!*** һ�˿������� ***
   subroutine quickpass(item, s, t, k)
   implicit none
   integer(4), intent(inout):: item(:)    ! �������У��������ʱ�ѷָ����
   integer(4), intent(in)::    s, t       ! �ֱ�Ϊ�������е���ʼ�������±�
   integer(4), intent(out)::   k          ! �������ʱΪ������±�
   integer(4)  pivot                      ! ����Ԫ��
   integer(4)  i, j                       ! �±����
   integer(4) temp

!--- ѡȡ����Ԫ�� ---

   pivot = item(s)   ! �򵥵�ȡ��һ��Ԫ��Ϊ���ᡣΪ�����ɻ�������ѡ�м��С��Ԫ��Ϊ����

!--- ���������а�����ָ�������� ---
   i = s
   j = t
   do while(i .lt. j)
      do while(i .lt. j .and. item(j) .ge. pivot)
         j = j - 1
      enddo
      item(i) = item(j)


     do while(i .lt. j .and. item(i) .le. pivot)
         i = i + 1
      enddo
	  item(j) = item(i)
   enddo


   ! ���°��������λ��
   item(i) = pivot

   k = i

!--- ��ӡ��ÿһ��������״̬ ---
   print 10, pivot, item

10 format('Pivot = ', i2, ':', <n>i4/)	

   end subroutine

	end program exam_8_4