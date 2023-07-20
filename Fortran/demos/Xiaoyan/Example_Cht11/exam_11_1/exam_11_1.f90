!****************************************************************************
!
!  PROGRAM: exam_11_1
!
!  PURPOSE: 包含语句示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_1

	implicit none

   ! 变量在包含文件中定义（相当于整体拷贝）
   !include 'def.txt'
    include 'def1.txt'
	
   a = 1
   b = 2

   print *, 'a = ', a, ' b = ', b

	end program exam_11_1