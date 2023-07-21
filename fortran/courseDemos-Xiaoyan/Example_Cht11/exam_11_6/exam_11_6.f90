!****************************************************************************
!
!  PROGRAM: exam_11_6
!
!  PURPOSE: ģ��ʹ��ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_6

!--- ����ģ�� ---
   use circle
      
	implicit none

!--- ʹ��ģ���еı��� ---
   print *, 'pi = ', pi

   call random_seed()

   ! ����10��Բ
   call create_radius(10)

   ! �����10��Բ�����
   call print_area

   ! ɾ����10��Բ
   call delete_radius
	
	end program exam_11_6

!====================================
!  ���Բ�����
!====================================
   subroutine print_area

!--- ����ģ�飬ʹ�ñ�����only���� ---
   use circle, only: area, radius, number=> n

   implicit none

!--- �������� ---
   integer(4) i   ! ѭ������

!--- ����ģ���ӳ������Բ��� ---
!   print *, 'pi = ', pi         ! ��ʱpi���ɼ�

   do i = 1, number
      print *, i, area(radius(i))
   enddo

   end