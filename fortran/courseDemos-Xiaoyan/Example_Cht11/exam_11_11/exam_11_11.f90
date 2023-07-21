!****************************************************************************
!
!  PROGRAM: exam_11_11
!
!  PURPOSE: ��ģ��ʵ���������ã�����֤����һ���ԣ��ο�exam_9_2��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     May 22, 2007
!  MODIFIED: May 20, 2010
!****************************************************************************

	program exam_11_11

   use course_type

	implicit none

!--- ʹ���˼�����״�����飬����Ҫ��interface˵�� ---
   interface
      subroutine output(c)
      use course_type
      implicit none
!      type course
!         character(9)  name           
!         integer(4)    credit
!         real(4) ::    score = 0.0    ! ȱʡ��ʼ��
!      end type

      type(course), intent(inout):: c(:)
      end
   end interface

!--- �γ��������Ͷ��� ---
!   type course
!      character(9)  name           
!      integer(4)    credit
!      real(4) ::    score = 0.0    ! ȱʡ��ʼ��
!   end type

!--- �ṹ��������� ---
   type(course) c(2)


!--- ���÷��ؽṹ��ĺ��� ---
   c(1) = input()
   c(2) = input()
	print *, 'Course(original): ', c
   print *

   call output(c)

   print *, 'Course(changed) : ', c

   contains
   !====================================
   ! ���ؽṹ��ĺ���
   !====================================
      type(course) function input()
      implicit none

      print *, "Please input 'name', 'credit' and 'score' to initiate a course"
      read *, input
      
      end function

	end program exam_11_11


!=====================================
! �ⲿ�����г�����������Է����������
!=====================================
   subroutine output(c)
   use course_type
   implicit none

!--- ���������Ϊ����Ŀγ��������ͺ��������еĿγ��������Ͳ���ͬһ������ ---
!   type course
!      character(9)  name           
!      integer(4)    credit
!      real(4) ::    score = 0.0    ! ȱʡ��ʼ��
!   end type

   type(course), intent(inout):: c(:)
   integer(4)                    i

   do i = 1, size(c)
      print *, 'Course(output)  : ', c(i)
      print *
      c = course('changed', 3, 0.0)
   enddo

	end

