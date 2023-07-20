!****************************************************************************
!
!  PROGRAM: exam_9_2
!
!  PURPOSE: �������ͺ��ӳ���Ĺ�ϵ
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 24, 2006
!  Modified: May   14, 2010
!****************************************************************************

	program exam_9_2

	implicit none

!--- �γ��������Ͷ��� ---
   type course
      character(9)  name           
      integer(4)    credit
      real(4) ::    score = 0.0    ! ȱʡ��ʼ��
   end type

!--- �ṹ��������� ---
   type(course) c
   type(course) input_ext

!--- ���÷��ؽṹ����ڲ����� ---
   c = input()
	print *, 'Course(internal): ', c
   print *

!--- ���÷��ؽṹ����ⲿ���� ---
   c = input_ext()
	print *, 'Course(external): ', c
   print *

!--- ����������Ϊʵ�� ---
   call output(c)

   print *, 'Course(changed) : ', c

   contains
   !====================================
   ! ���ؽṹ��ĺ���
   !====================================
      type(course) function input()
      implicit none

      print *, "Please input 'name', 'credit' and 'score' to initiate a course (internal)"
      read *, input
      
      end function

	end program exam_9_2

!=====================================
! �ⲿ�������������Է����������
!=====================================
   function input_ext()
   implicit none

!--- ���������һ�ζ���γ��������� ---
   type course
      character(9)  name           
      integer(4)    credit
      real(4) ::    score = 0.0    ! ȱʡ��ʼ��
   end type

   type(course) input_ext

   print *, "Please input 'name', 'credit' and 'score' to initiate a course (external)"
   read *, input_ext
      
   end function

!=====================================
! �ⲿ�����г�����������Է����������
!=====================================
   subroutine output(c)
   implicit none

!--- ���������һ�ζ���γ��������� ---
   type course
      character(9)  name           
      integer(4)    credit
      real(4) ::    score = 0.0    ! ȱʡ��ʼ��
   end type

!--- �ṹ����Ϊ�β� ---
   type(course), intent(inout):: c

   print *, 'Course(output)  : ', c
   print *

   c = course('changed', 3, 0.0)
   
   end
