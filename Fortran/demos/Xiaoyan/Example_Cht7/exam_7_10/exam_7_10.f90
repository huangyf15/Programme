!****************************************************************************
!
!  PROGRAM: exam_7_10
!
!  PURPOSE: �ɷ�������ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March 21, 2006
!  MODIFIED: April 15, 2009
!****************************************************************************

	program exam_7_10

	implicit none

	! ��������
   integer(4)  i, err
   integer(4), allocatable:: a(:)   ! �ɷ�������˵��ʱһ��Ҫ��:˵��ά��

!--- ��������ռ� ---
	print *, 'Please input the dimension of array a'
   read *, i

   ! err == 0 ����������
   allocate(a(i), stat = err)
   if(err .ne. 0) stop 'Array allocation error!'

   a = 1
   print *, 'a = ', a

!--- �����ظ����� ---
   allocate(a(3), stat = err)
   if(err .ne. 0) then
      print *, 'Array allocated: ', allocated(a)
      stop 'Array reallocated!'
   endif

!--- �ͷ�����ռ������������ ---
   a = 2
   print *, 'a = ', a

   deallocate(a)

!   print *, 'a = ', a

	end program exam_7_10

