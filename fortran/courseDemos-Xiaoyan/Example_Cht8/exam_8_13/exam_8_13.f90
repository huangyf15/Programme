!****************************************************************************
!
!  PROGRAM: exam_8_13
!
!  PURPOSE: �ɷ���������Ϊ�βΣ�Fortran95��
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_13

	implicit none

   ! �βΰ����ٶ���״�����ɷ�������ʱ���������ʽ����
   interface
      subroutine list(b)
      implicit none
      integer(4), intent(in):: b(:,:)
      end

      subroutine alloc(a)
      implicit none
      integer(4), allocatable, intent(out):: a(:)
      end
   end interface
      
   ! ��������
   integer(4), allocatable:: a(:), b(:,:)
   integer(4) err

!--- �ɷ������������Ϊʵ�� ---
   allocate(b(2,3), stat = err)
   if(err .ne. 0) stop 'Failed to allocate array b!'   
   b = 3
   call list(b)

!--- Fortran95�в�����ɷ���������Ϊ�βΣ�Fortran2003������ ---
   ! �������黹û�б������ڴ�ռ�
   print *, 'Allocated a? ', allocated(a)
   
   ! ���ӳ����и���������ڴ�ռ�
   call alloc(a)

   ! �᷵���ڴ��ѷ��䣨T�����������ַû�ж���
   print *, 'Allocated a? ', allocated(a)

   ! ��ʱ���������������
   print *, 'a = ', a
   
   ! �������������������򣬺�Σ��
   !a = 2
   print *, 'a = ', a

   ! ���ھ����ַû�ж��壬���Ի����
!   deallocate(a)

	end program exam_8_13

!====================================
!  ��ӡ������״�����е�Ԫ��
!====================================
   subroutine list(b)
   implicit none
   integer(4), intent(in):: b(:,:)
  ! integer(4), allocatable:: b(:,:)
   integer(4) i, j

  ! print *, 'Allocated b? ', allocated(b)

   print *, 'b = '
   do i = 1, ubound(b,1)
      print *, (b(i,j), j = 1, ubound(b,2))
   enddo
   print *

!   deallocate(b)

   end   

!====================================
!  ���ɱ���������ڴ�ռ�
!====================================
   subroutine alloc(a)
   implicit none
   integer(4), allocatable, intent(out):: a(:)
   integer(4) err

   allocate(a(5), stat = err)
   if(err .ne. 0) stop 'Failed to allocate array a!'

   a = 1
   print *, 'a = ', a

   ! �ӳ��򷵻غ󣬿ɷ���������ڴ�ռ�û�б���

   end      