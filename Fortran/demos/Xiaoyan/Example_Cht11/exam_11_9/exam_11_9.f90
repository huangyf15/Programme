!****************************************************************************
!
!  PROGRAM: exam_11_9
!
!  PURPOSE: 静态绑定示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_9

!--- 引用模块 ---
   use point_class      ! 必须显示引用，否则私有point类型不可见（对line_class是可见的）

   use line_class

   implicit none

!--- 变量定义 ---
   type(point) p1, p2
   type(line)  a_line

!--- create objects （根据实参类型知道调用相关的函数，静态绑定） ---
   call new(p1,  5.0, 10.0)
   call new(p2, 10.0, 20.0)
   call new(a_line, p1, p2)

!--- draw them （根据实参类型知道调用相关的函数，静态绑定）---
   call draw(p1)
   call draw(a_line)
	
	end program exam_11_9

