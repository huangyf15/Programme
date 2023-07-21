!****************************************************************************
!
!  PROGRAM: exam_7_13
!
!  PURPOSE: 用线性同余法产生伪随机数，并观察其循环周期随种子的变化
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April  8, 2008
!  MODIFIED: April 14, 2010
!****************************************************************************

	program exam_7_13

	implicit none

	! Variables
   integer(4), parameter:: a = 13   ! 乘数
   integer(4), parameter:: c = 3    ! 增量，尝试取为3, 4
   integer(4), parameter:: m = 16   ! 除数
   integer(4) x   ! 余数
   integer(4) i   ! 循环变量
   

	! 设定伪随机数的种子
   x = 3   ! 试试取种子为2, 3, 4

   ! 产生伪随机数序列（a, c, m 和种子决定了伪随机数循环周期的长短）
   do i = 1, 2 * m
      x = mod(a * x + c, m)
      
      print *, i, real(x) / m
   enddo
	end program exam_7_13

