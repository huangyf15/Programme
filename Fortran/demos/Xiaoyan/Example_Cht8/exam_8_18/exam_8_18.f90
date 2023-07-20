!****************************************************************************
!
!  PROGRAM: exam_8_18
!
!  PURPOSE: ����������
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 11, 2006
!  MODIFIED: Nov.  27, 2011
!****************************************************************************

	program exam_8_18
 
	implicit none

   ! ����'+'������
   interface operator(+)
      function add_string(c1, c2)
      implicit none
      character(*), intent(in):: c1, c2
      character(len_trim(c1)+len_trim(c2)) add_string
!      character(len(c1)+len(c2)) add_string ! ���Կ�
      end
   end interface

   ! �Զ����������в�����
   interface operator(.reverse.)
      function rev(a)
      implicit none
      integer(4), intent(in):: a(:)
      integer(4) rev(ubound(a,1))
      end
   end interface

   ! ����'.gt.'������
   interface operator(.gt.)
      function cmp(c1, c2)
      implicit none
      character(*), intent(in):: c1, c2
      logical cmp
      end
   end interface

	! ��������
   character(15)  c1, c2
   integer(4)     a(4)

	! ����������ֵ
   c1 = "Programing"
   c2 = " is fun!"
   a  = [1:4]
	
!--- �����ַ������ ---
   ! ���ڲ�������
   print *, 'string: ', c1 // c2, ' length = ', len(c1 // c2)

   ! �����ز�����
   print *, 'string: ', c1 + c2, ' length = ', len(c1 + c2)

   print *, char(56) + 'a'

   ! ֱ�����Զ��庯��
   print *, 'string: ', add_string(c1, c2), ' length = ', len(add_string(c1, c2))
   print *

!--- ������Ԫ���������� ---
   print *, 'The original data : ', a
   print *, 'The resultant data: ', .reverse. a
   print *

!--- �Ƚ������ַ����ĳ��� ---
   ! �����صĲ�����
   print *, "Language" .gt. "Program"

   ! ����'.gt.'�൱������'>'
   print *, "Language" > "Program"

	end program exam_8_18

!====================================
! �������ַ�����ӣ�����ȥ��β���ո�
!====================================
   function add_string(c1, c2)
   implicit none
   character(*), intent(in):: c1, c2
   character(len_trim(c1)+len_trim(c2)) add_string

   add_string = trim(c1) // trim(c2)

   end

!====================================
! ������Ԫ����������
!====================================
   function rev(a)
   implicit none
   integer(4), intent(in):: a(:)
   integer(4) rev(ubound(a,1))

   rev(1:ubound(a,1)) = a(ubound(a,1):1:-1)
   
   end 

!====================================
! �Ƚ������ַ����ĳ���
!====================================
   function cmp(c1, c2)
   implicit none
   character(*), intent(in):: c1, c2
   logical cmp

   cmp = .false.
   if(len_trim(c1) .gt. len_trim(c2)) cmp = .true.

   end
