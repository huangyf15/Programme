!****************************************************************************
!
!  PROGRAM: exam_8_5
!
!  PURPOSE: 语句函数示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 4, 2006
!****************************************************************************

	program exam_8_5

	implicit none

	! 变量定义
   real(4):: x = 1.0_4, y = 2.0_4, z = 2.0_4
   real(4):: x1, y1, z1, r1
   real(4)   r, dir

   ! 这是说明语句，一定要放在可执行语句之前
   dir(x1, y1, z1, r1) = r1 / sqrt(x1 * x1 + y1 * y1 + z1 * z1)

   print *, 'The direction is: ',&
             dir(x, y, z, x), dir(x, y, z, y), dir(x, y, z, z)	

	end program exam_8_5

