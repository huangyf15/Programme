!****************************************************************************
!
!  PROGRAM: exam_10_2
!
!  PURPOSE: ָ����Ϊ����ʾ����ѡ���������
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_10_2

	implicit none
   
!--- �������Ͷ��� ---
   ! �γ�����
   type course
      character(9)   name
      integer(4)     credit
      real(4)        score
   end type

   ! ѧ������
   type student_info
      character(9)  name
      real(4)       avg
      type(course)  scores(2)
   end type

   ! ָ��student_info�ṹ���ָ��
   type student_link
      type(student_info), pointer:: p_student
   end type

!--- �������� ---
   ! �ṹ���������
   type(student_info), target::  students(5) ! �ṹ������
   type(student_info), pointer:: p_student   ! ����ָ��
   type(student_link)            rank(5)     ! ָ������
   integer(4)  i, j, index

!--- ��ʼ��ѧ����Ϣ ---
   ! ��ѧ��������
   students(1)%name = '����'
   students(2)%name = '����'
   students(3)%name = '�ܶ�'
   students(4)%name = '��ά'
   students(5)%name = '���'

   ! �������е�ʱ�̲������������
   call random_seed()

   do i = 1, 5
      ! ����ѧ���ɼ�
      students(i)%scores(1) = course('English', 4, score())
      students(i)%scores(2) = course('Calculus', 4, score())
      students(i)%avg       = (students(i)%scores(1)%score +&
                               students(i)%scores(2)%score) / 2.0

      ! ��ʼ��������Ϣ
      rank(i)%p_student => students(i)
   enddo

   call out('Original info:')

!--- �����ſε�ƽ���ɼ��Ӵ�С�������� ---
   do i = 1, 4
      index = i
      do j = i, 5
         if(rank(index)%p_student%avg .lt. rank(j)%p_student%avg) index = j
      enddo

      ! �������Ա��⿽����������
      if(index .ne. i) then
         p_student             => rank(i)%p_student
         rank(i)%p_student     => rank(index)%p_student
         rank(index)%p_student => p_student
      endif
   enddo
         
   call out('Final rank:')

   contains
      !====================================
      ! ����̬�ֲ������ɼ���ƽ���ɼ�85�֣���׼����5��
      !====================================
      real(4) function score()
      real(4), parameter:: pi2 = 3.1415926 * 2.0
      real(4) r1, r2
      
      call random_number(r1)
      call random_number(r2)
      score = 85.0 + 5.0 * sin(pi2 * r1) * sqrt(-2.0 * log(r2))
      
      end function

      !====================================
      ! ��ӡѧ���ɼ�
      !====================================
      subroutine out(banner)
      character(*) banner
      type(student_info), pointer:: p_student   ! ����ָ��

      print *, banner

      print *, '����', '  ƽ���ɼ�', '  English', '  Calculus' 
      print *, '---------------------------------'

      do i = 1, 5
         p_student => rank(i)%p_student
         print 10, trim(p_student%name), p_student%avg,&
                   p_student%scores(1)%score, p_student%scores(2)%score 
      enddo
      print *

10    format(1x, a, 4x, f4.1, 6x, f4.1, 5x, f4.1)

      end subroutine
         
	end program exam_10_2