!****************************************************************************
!
!  PROGRAM: exam_4_4
!
!  PURPOSE: ����ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 1, 2006
!  MODIFIED: March 12, 2010
!****************************************************************************

   program exam_4_4

   implicit none

	! ��������
   !--- Integer declaration ---
   byte              a
   integer           aa
   integer(4)        b
   integer(kind = 4) c
   integer*4         d
   
   integer, parameter:: int3 = selected_int_kind(6)   ! ����ֵ
   integer(int3)     e

   !--- Real declaration ---
   real              f
   real(4)           g
   real(kind = 4)    h
   real*4            i
   real*8            j
   double precision  k

   integer, parameter:: real8 = selected_real_kind(9)
   real(real8)       l

   !--- Complex declaration ---
   complex           m
   complex(4)        n
   complex(kind = 4) o
   complex*8         oo
   complex(real8)::  p = (1.0d0, 2.0d0)

   !--- Character declaration ---
   character(2)::       q = 'OK'
   character(len = 2)   r
   character*2          s, t*3   ! �Ժ���Ķ�����*�ź�ĳ���Ϊ׼

   !--- Logical declaration ---
   logical           u
   logical(2)        v
   logical(kind = 4) w
   logical*8         x

	! ������kind����
   print *, 'e is kind of ', kind(e)

	print *, 'l is kind of ', kind(l)


end program exam_4_4
