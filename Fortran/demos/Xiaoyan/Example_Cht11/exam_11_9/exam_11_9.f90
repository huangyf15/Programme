!****************************************************************************
!
!  PROGRAM: exam_11_9
!
!  PURPOSE: ��̬��ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_9

!--- ����ģ�� ---
   use point_class      ! ������ʾ���ã�����˽��point���Ͳ��ɼ�����line_class�ǿɼ��ģ�

   use line_class

   implicit none

!--- �������� ---
   type(point) p1, p2
   type(line)  a_line

!--- create objects ������ʵ������֪��������صĺ�������̬�󶨣� ---
   call new(p1,  5.0, 10.0)
   call new(p2, 10.0, 20.0)
   call new(a_line, p1, p2)

!--- draw them ������ʵ������֪��������صĺ�������̬�󶨣�---
   call draw(p1)
   call draw(a_line)
	
	end program exam_11_9

