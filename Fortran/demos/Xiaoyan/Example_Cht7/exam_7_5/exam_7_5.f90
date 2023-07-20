
!****************************************************************************
!
!  PROGRAM: exam_7_5
!
!  PURPOSE: 查询数组属性的函数示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_5

   implicit none

   ! 变量定义
   integer(4)  a(-1:2, 2:4)

!--- 各种查询函数 ---
   ! 数组每一维的下界
   print *, 'lbound(a): ', lbound(a)

   ! 数组每一维的上界
   print *, 'ubound(a): ', ubound(a)

   ! 数组每一维的大小
   print *, 'shape(a) : ', shape(a)

   ! 数组元素的个数
   print *, 'size(a)  : ', size(a)

   ! 数组占用的字节数
   print *, 'sizeof(a): ', sizeof(a)

	end program exam_7_5

