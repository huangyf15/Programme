!****************************************************************************
!
!  PROGRAM: exam_8_3
!
!  PURPOSE: 内部子程序示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 3, 2006
!****************************************************************************

	program exam_8_3

	implicit none

	! 变量定义
   real(4):: x = 1.0_4, y = 2.0_4, z = 2.0_4
   real(4)   l
	
!--- 计算长度 ---
   l = sqrt(x * x + y * y + z * z)

!--- 在主程序中计算方向数 ---
   print *, 'The direction is (host      ): ', x / l, y / l, z / l
   print *

!--- 调用内部子程序计算方向数 ---
   print *, 'The direction is (dir       ): ', dir(x), dir(y), dir(z)
   print *

   call output
   
   contains
!====================================
! 计算方向数
!====================================
      real(4) function dir(a)
      implicit none
      real(4) a
      real(4):: l = 2.0

      ! 内部子程序中定义的变量将host中定义的变量覆盖
      dir = a / l

      end function   ! The keyword 'function' is a must.

!====================================
! 调用已经定义的内部子程序和变量的内部子程序
!====================================
      subroutine output
      implicit none

      ! 内部子程序可以使用host中定义的变量
      ! dir中定义的l在这里不可见
      print *, 'The direction is (output    ): ', x / l, y / l, z / l
      print *

      ! 内部子程序可以调用内部子程序，不用额外申明
      print *, 'The direction is (output-dir): ', dir(x), dir(y), dir(z)

      end subroutine ! The keyword 'subroutine' is a must.

   end program exam_8_3

