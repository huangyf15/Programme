!****************************************************************************
!
!  PROGRAM: exam_11_2
!
!  PURPOSE: ������ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_2

	implicit none

!--- �������� ---
   integer(2)                a
   integer(4), target     :: b, c(3)
   real(4)                   x, y, z(4)
   character(7)              ch
   integer(4), pointer    :: p, pa(:)
   integer(4), allocatable:: at(:)

   ! ������������ֻ����һ����
   common c, x(2), a          ! �ڹ������п�������������� x(2)
                              ! ����������������ڹ�������ֻ�ܳ��������� c
   
   ! ����������
   common /data1/ b, z                 ! ���Էֳɶ��common�����д
   common /data1/ ch /data2/ y, p, pa  ! һ��common�������������������

!   common /data3/ at                   ! �������в��ܰ�����С�����ı���
   

!--- ������ʹ��ʾ�� ---
   ! ����������ֵ
	a = 1
   b = 2
   c = (/3:5/)
   x = 6.0
   y = 7.0
   data z /8.0, 9.0, 10.0, 11.0/
   ch = 'Fortran'

   p  => b
   pa => c

   ! �ù��������ݱ���
   call output

	end program exam_11_2


!====================================
!  ����������б�����ֵ
!====================================
   subroutine output
   implicit none

   integer(2)                a
   integer(4), target     :: b, c(3)
   real(4)                   x, y, z(4)
   character(7)              ch
   integer(4), pointer    :: p, pa(:)
   integer(4), allocatable:: at(:)

   common c, x(2), a
   common /data1/ b, z, ch
   common /data2/ y, p, pa

!  common /data1/ z, b, ch    ! ע�����������˳��
   

   print *, 'a  = ', a
   print *, 'b  = ', b
   print *, 'c  = ', c
   print *, 'x  = ', x
   print *, 'y  = ', y
   print *, 'z  = ', z
   print *, 'ch = ', ch
   print *, 'p  = ', p
   print *, 'pa = ', pa

   end

