!****************************************************************************
!
!  PROGRAM: exam_11_6
!
!  PURPOSE: 模块使用示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_6

!--- 引用模块 ---
   use circle
      
	implicit none

!--- 使用模块中的变量 ---
   print *, 'pi = ', pi

   call random_seed()

   ! 产生10个圆
   call create_radius(10)

   ! 输出这10个圆的面积
   call print_area

   ! 删除这10个圆
   call delete_radius
	
	end program exam_11_6

!====================================
!  输出圆的面积
!====================================
   subroutine print_area

!--- 引用模块，使用别名及only属性 ---
   use circle, only: area, radius, number=> n

   implicit none

!--- 变量定义 ---
   integer(4) i   ! 循环变量

!--- 调用模块子程序，输出圆面积 ---
!   print *, 'pi = ', pi         ! 此时pi不可见

   do i = 1, number
      print *, i, area(radius(i))
   enddo

   end