!****************************************************************************
!
!  PROGRAM: exam_11_8
!
!  PURPOSE: 数据封装示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_8

!--- 引用模块 ---
   use circles

	implicit none

!--- 定义两个圆变量 ---
   type(circle) c1, c2

!--- 产生两个圆，并判断是否相交 ---
   call create_circle(c1, 1.0, 2.0, 3.0)

   call create_circle(c2, 1.0, 3.0, 3.0)

   print *, 'c1 和 c2 相交? ', c1 .crosses. c2
	
!   print *, c1   ! 私有成员不可见

	end program exam_11_8

