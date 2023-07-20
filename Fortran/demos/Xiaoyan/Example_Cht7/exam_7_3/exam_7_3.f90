!****************************************************************************
!
!  PROGRAM: exam_7_3
!
!  PURPOSE: 数组的输入输出
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_3

	implicit none

	! 变量定义
   integer(4)  i, j
   integer(4)  a(3)
   integer(4)  b(2,3)   

!--- 按数组元素输入输出 ---
   do i = 1, 3
      read *, a(i)
   enddo
   
   print *
   do i = 1, 3          ! 4 数组越界（release不检查）
     print *, a(i)
   enddo

!--- 用隐含do循环进行输入输出 ---
   read *, (a(i), i = 1, 3)
   print *
   print *, (a(i), i = 1, 3)

!--- 数组整体输入输出 ---
   read *, a
   print *
   print *, a

!--- 各种方式的混合 ---
   read *, ((b(i,j), j = 1, 3), i = 1, 2)
   print *
   print *, b
   
   print *
   do i = 1, 2
      print *, b(i,:)
   enddo

	end program exam_7_3

