!****************************************************************************
!
!  PROGRAM: exam_9_1
!
!  PURPOSE: �������͵Ļ�������ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_9_1

	implicit none

!--- �������Ͷ��� ---
   ! �γ�����
   type course
      !sequence                      ! ʹ��Ա�洢ʱ��˳��Ͷ���ʱһ�����������ڴ����������
      character(9)   name           ! Pay attention to the alignment
      integer(4)     credit
      real(4) ::     score = 0.0    ! ȱʡ��ʼ��
   end type

   ! ѧ������
   type student_info
      character(10)  name
      ! �ù��캯����ȱʡ��ʼ������
      type(course) :: scores(2) = course('English', 4, 85.0)
      ! Fortran2003������ɷ���������Ϊ�������ͳ�Ա
 !     integer(4), allocatable :: a(:)
   end type

!--- �������� ---
   ! �ṹ���������
   type(course)::       fortran = course('Fortran', 2, 90.0) ! �ù��캯����ʼ��
   type(student_info)   dem(3)                               ! �ṹ������
   integer(4)           i


!--- �ṹ��Ĵ�С��sequence��� ---
!    ����sequence������ռ�Ĵ洢�ռ�Ϊ�ĸ��ֽڣ�32λϵͳ����������
   print *, 'sizeof(fortran) = ', sizeof(fortran)
   print *

!--- �ṹ��ĸ�ֵ ---
   ! ����Ա����������ֵ
   dem(1)%name             = '����'
   dem(1)%scores(1)%name   = 'Calculus'               ! �Ḳ�ǵ�ȱʡֵ
   dem(1)%scores(1)%credit = 3 


   !dem(2)%name      = '����'
   !dem(2)%scores(1) = course('Physics', 3, 70.0)      ! �ù��캯����ֵ 
   !data dem(2)%scores(2) /course('Fortran', 2, 85.0)/ ! ��data����ʼ��

   data dem(2) /student_info('����', course('Fortran', 2, 85.0))/


   ! �ṹ�����帳ֵ
   dem(3) = dem(1)

!--- �ṹ������������������ƣ�ʡ�ԣ� ---
   ! ���������˳���������Ͷ���ʱ��˳��
   print *, fortran
   print *

   ! ������Ա���
   do i = 1, 3
      print 10, dem(i)
   enddo
10 format(a, 2(3x, a, i3, f7.1)/)

	end program exam_9_1

