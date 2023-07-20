!****************************************************************************
!
!  PROGRAM: exam_11_10
!
!  PURPOSE: 动态绑定示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_10

!--- 引用模块 ---
   use graphic_object_class   ! 可以只引用这一个模块，因为它已经把需要用到的信息说明为public
   
   implicit none

!--- 变量定义 ---
   type(graphic_object) g1, g2
   type(point)          p1, p2
   type(line)           a_line

!--- create objects （p1, p2和a_line是不同的类型，所以这里是根据实参类型知道调用相关的函数，属于静态绑定） ---
   call new(p1,  5.0, 10.0)
   call new(p2, 10.0, 20.0)
   call new(a_line, p1, p2) ! oo equivalent : a_line = new a_line(p1,p2);

!--- create generic objects （p1和a_line是不同的类型，所以这里是根据实参类型知道调用相关的函数，属于静态绑定）---
   call create_graphic_object(g1, p1)
   call create_graphic_object(g2, a_line)

!--- draw them （g1和g2是相同的类型，所以这里相当于调用虚函数，属于动态绑定）---
   call draw_graphic_object(g1) ! oo equiv. : g1.draw_graphic_object();
   call draw_graphic_object(g2)

	end program exam_11_10

