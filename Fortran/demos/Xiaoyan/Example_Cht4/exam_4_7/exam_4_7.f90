!****************************************************************************
!
!  PROGRAM: exam_4_7
!
!  PURPOSE: 变量类型所能表示的范围示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March 1, 2006
!  MODIFIED: Nov.  4, 2010
!****************************************************************************

	program exam_4_7

	implicit none

   ! 变量定义
   byte    a
   real(4) b, c, d

	! byte: -128~127
   a = 128   
   print *, a

   print *, 513_1
   print *
 
   ! real(4): -3.402823E38 ~-1.175495E-38 0.0 1.175495E-38~ 3.402823E38 
   b = 2.0e-38
   c = 1.5e-38
!   d = b - c     !下溢
!   print *, d
   print *
   
   b = 1.0e38
   c = 3.0e38
   d = b + c      !上溢
   print *, d	

   ! 第8位有效数字不准确
   print *, 1.175495E-38, 1.175494E-38

	end program exam_4_7

