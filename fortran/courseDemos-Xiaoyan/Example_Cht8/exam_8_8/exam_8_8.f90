!****************************************************************************
!
!  PROGRAM: exam_8_8
!
!  PURPOSE: ��̬��ʽ������Ϊ�β�
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_8

	implicit none

	! ��������
   integer(4)                a(6), b(2,3), c(3,3)
   character(*), parameter:: ch(5) = (/'1111', '2222', '3333', '4444', '5555'/)

!--- �������������ֵ ---
   a = (/1:6/)
   b = reshape((/6:1:-1/),shape(b))
   c = reshape((/1:9/),shape(c))

   call list('*** Original data ***')

!--- ʵ���������൱�ڸ��������ʼ��ַ ---
   call sub1(a, b)
   
   call sub1(c(1,1), c(2,1))

   call list('*** After called sub1 ***')

   ! �ַ�������
   call sub2(ch)

   contains
      !====================================
      ! ��ӡ���е�����
      !====================================
      subroutine list(banner)
      implicit none
      character(*), intent(in):: banner
      integer(4)   i, j
   
      print *, banner

      print *, 'a:'
      print *, a
 
      print *, 'b:'
      do i = 1, 2
         print *, (b(i,j), j = 1, 3)
      enddo
	
      print *, 'c:'
      do i = 1, 3
         print *, (c(i,j), j = 1, 3)
      enddo
      print *

      end subroutine

	end program exam_8_8

!====================================
! ע������Ԫ���ǰ�������
!====================================
   subroutine sub1(x, y)
   implicit none
   integer(4) x(2,3), y(6)
   integer(4) i, j

   print *, 'x:'
   do i = 1, 2
      print *, (x(i,j), j = 1, 3)
   enddo

   print *, 'y:'
   print *, (y(i), i = 1, 6)  ! Խ�磬����������Σ��
   print *

   ! ����Ҳ�ǰ���ַ����
   x = 0
   y = 1

   end

!====================================
! �ַ��������൱��һ�������ַ�����
! ÿһ������Ԫ���൱��һ�����ַ�����
!(2014.4.22��)ʵ���������������Ԫ��
!���洢�������һ�����ַ�������ʽ��������Ԫ����ɵ��ַ������н��
!====================================
   subroutine sub2(ch)
   implicit none
   character(5)  ch(4)
   integer(4)    i

   do i = 1, 4
      print *, ch(i)
   enddo

   end
