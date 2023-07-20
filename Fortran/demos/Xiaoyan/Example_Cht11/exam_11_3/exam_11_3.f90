!****************************************************************************
!
!  PROGRAM: exam_11_3
!
!  PURPOSE: 数据块示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_3

	implicit none

!--- 变量定义（用block data赋初值） ---
   integer(4)  a, b, c, d
   real(4)     x, y, z

   common a, b, c

   common /data1/ d, x
   
   common /data2/ y, z

	
!--- 输出变量的值 ---   	
   print *, 'a = ', a
   print *, 'b = ', b
   print *, 'c = ', c
   print *, 'd = ', d
   print *, 'x = ', x
   print *, 'y = ', y
   print *, 'z = ', z

	end program exam_11_3

!====================================
!  无名数据块
!====================================
   block data
   implicit none
   integer(4) a, b, c, d
   real(4)    x

   common a, b, c
   common /data1/ d, x

   ! Visual Fortran可以给无名公用区赋初值（按标准一般不行）
   ! 可以只给公用区中的部分变量赋初值（c未赋初值）
   data a /1/
   data b /2/

   ! 一个数据块可以给多个公用区赋初值
   data d /1/
   data x /2.0/

   end

!====================================
!  有名数据块
!====================================
   block data blk
   implicit none
   integer(4) d
   real(4)    x, y, z

   common /data1/ d, x
   
   common /data2/ y, z

   ! 一个公用区可以在不同的数据块中赋初值
   data d /3/
   data x /4.0/

   data y /0.0/
   data z /5.0/

   end