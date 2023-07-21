!****************************************************************************
!
!  PROGRAM: exam_10_4
!
!  PURPOSE: ��̬�����ڴ�ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_10_4

	implicit none
   
 !--- �������Ͷ��� ---
   type row
      integer(4), pointer:: r(:)    ! ָ��һά���������ָ��
   end type

!--- �������� ---
   integer(4), parameter:: n = 4
   type(row)               a(n)     ! ָ������
   integer(4)              i, j     ! ѭ������
   integer(4)              err      ! �����ʶ

!--- ������ָ�������Ԫ�ض�Ӧ��һά���� ---
   do i = 1, n
      allocate(a(i)%r(1:i), stat = err)
      if(err .eq. 0) then
         a(i)%r = i
      else
         print *, 'Memery allocation error, i = ', i, ' stat = ', err
         stop
      end if
   end do

   ! ��ָ�����鲻�ܽ����������
!   print *, a
   
   ! ��ӡ����ֵ�����ͷ��ڴ�ռ�
   do i = 1, n
      print *, (a(i)%r(j), j = 1, i)
      deallocate(a(i)%r, stat = err)
      if(err .ne. 0) then
         print *, 'Memery deallocation error, i = ', i, ' stat = ', err
         stop
      end if
   enddo

	end program exam_10_4