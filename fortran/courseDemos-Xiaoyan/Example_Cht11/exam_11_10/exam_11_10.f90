!****************************************************************************
!
!  PROGRAM: exam_11_10
!
!  PURPOSE: ��̬��ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_10

!--- ����ģ�� ---
   use graphic_object_class   ! ����ֻ������һ��ģ�飬��Ϊ���Ѿ�����Ҫ�õ�����Ϣ˵��Ϊpublic
   
   implicit none

!--- �������� ---
   type(graphic_object) g1, g2
   type(point)          p1, p2
   type(line)           a_line

!--- create objects ��p1, p2��a_line�ǲ�ͬ�����ͣ����������Ǹ���ʵ������֪��������صĺ��������ھ�̬�󶨣� ---
   call new(p1,  5.0, 10.0)
   call new(p2, 10.0, 20.0)
   call new(a_line, p1, p2) ! oo equivalent : a_line = new a_line(p1,p2);

!--- create generic objects ��p1��a_line�ǲ�ͬ�����ͣ����������Ǹ���ʵ������֪��������صĺ��������ھ�̬�󶨣�---
   call create_graphic_object(g1, p1)
   call create_graphic_object(g2, a_line)

!--- draw them ��g1��g2����ͬ�����ͣ����������൱�ڵ����麯�������ڶ�̬�󶨣�---
   call draw_graphic_object(g1) ! oo equiv. : g1.draw_graphic_object();
   call draw_graphic_object(g2)

	end program exam_11_10

