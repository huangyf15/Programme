!****************************************************************************
!
!  PROGRAM: exam_8_20
!
!  PURPOSE: 和C语言混合编程示例（调用C语言函数）
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 11, 2006
!  MODIFIED: Nov.  25, 2010
!****************************************************************************

	program exam_8_20

	implicit none      

   ! 通过这种方式告诉编译程序C语言函数的接口
   interface
	   subroutine c_print(a, b)
      ! 在*.obj文件中，函数名称全转化成小写字母，而且像C语言一样，在函数名前加_
	   !DEC$ attributes c :: c_print

      ! 参数的传递方式为：Call by reference
       !DEC$ attributes reference :: a, b
	   integer(4) a
	   real(8)    b
	   end subroutine c_print

	   subroutine d_print(a, b)
      ! C_print函数名包含大写和小写字母，为了能识别它需要用一个别名
	   !DEC$ attributes alias:'_C_print' :: d_print

      ! 参数的传递方式为：Call by reference
      !DEC$ attributes reference :: a, b
	   integer(4) a
	   real(8)    b
	   end subroutine d_print
	end interface

   ! 变量定义
   integer(4) :: a = 1
	real(8)    :: b = 2.0_8
      
!--- 调用C语言编写的函数 ---   
   call c_print(a, b)

   ! 函数返回后，实参的值也发生了改变
	print *, "In Fortran"
   print *, "a = ", a, " b = ", b
   print *

   call d_print(a, b)

   ! 函数返回后，实参的值也发生了改变
	print *, "In Fortran"
   print *, "a = ", a, " b = ", b

	end program exam_8_20