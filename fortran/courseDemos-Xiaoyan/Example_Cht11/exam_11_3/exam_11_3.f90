!****************************************************************************
!
!  PROGRAM: exam_11_3
!
!  PURPOSE: ���ݿ�ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_3

	implicit none

!--- �������壨��block data����ֵ�� ---
   integer(4)  a, b, c, d
   real(4)     x, y, z

   common a, b, c

   common /data1/ d, x
   
   common /data2/ y, z

	
!--- ���������ֵ ---   	
   print *, 'a = ', a
   print *, 'b = ', b
   print *, 'c = ', c
   print *, 'd = ', d
   print *, 'x = ', x
   print *, 'y = ', y
   print *, 'z = ', z

	end program exam_11_3

!====================================
!  �������ݿ�
!====================================
   block data
   implicit none
   integer(4) a, b, c, d
   real(4)    x

   common a, b, c
   common /data1/ d, x

   ! Visual Fortran���Ը���������������ֵ������׼һ�㲻�У�
   ! ����ֻ���������еĲ��ֱ�������ֵ��cδ����ֵ��
   data a /1/
   data b /2/

   ! һ�����ݿ���Ը��������������ֵ
   data d /1/
   data x /2.0/

   end

!====================================
!  �������ݿ�
!====================================
   block data blk
   implicit none
   integer(4) d
   real(4)    x, y, z

   common /data1/ d, x
   
   common /data2/ y, z

   ! һ�������������ڲ�ͬ�����ݿ��и���ֵ
   data d /3/
   data x /4.0/

   data y /0.0/
   data z /5.0/

   end