!****************************************************************************
!
!  PROGRAM: exam_8_15
!
!  PURPOSE: �����ӳ����б�����ֵ��save ��data��
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_15

	implicit none

	! ��������
   integer(4)  save_save, save_data

!--- ע�⺯�����غ󣬺����б�����ֵ�Ƿ��� ---
!    Visual Fortran ���ڲ�����ȱʡ��SAVE�ġ�
!  ����һ��Ҫ���ɸ���������ֵ��ϰ��!!!

   ! û����data����ֵ�ı���
	print *, 'sum1 = ', save_save()
   print *, 'sum2 = ', save_save()
   print *
  
   ! ��data����ֵ�ı���
	print *, 'sum1 = ', save_data()
   print *, 'sum2 = ', save_data()
   print *

	end program exam_8_15

!====================================
! ������save���ԣ�Visual Fortran��ֻҪ
!���ڲ���������save�ģ�
!====================================
   integer(4) function save_save()
   implicit none
   integer(4) i
!   integer(4), save:: sn = 0 ! save ��Ϊһ�ֱ�������
!   integer(4):: sn = 0
   integer(4):: sn

   save sn        ! save Ҳ������Ϊһ��������˵�����

   ! һ��Ҫ���ɸ���������ֵ��ϰ��!!!
   !sn = 0

   do i = 1, 10
      sn = sn + i
   enddo
   
   save_save = sn

   end   

!====================================
! ��data��ֵ�ı���һ����save���Ե�
!====================================
   integer(4) function save_data()
   implicit none
   integer(4) i
  integer(4), save:: sn
 !  integer(4) sn

   data sn /1/

   ! һ��Ҫ���ɸ���������ֵ��ϰ��!!!
   !sn = 0

   do i = 1, 10
      sn = sn + i
   enddo
   
   save_data = sn

   end