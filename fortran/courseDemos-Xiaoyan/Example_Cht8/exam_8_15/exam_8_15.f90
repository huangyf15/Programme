!****************************************************************************
!
!  PROGRAM: exam_8_15
!
!  PURPOSE: 保留子程序中变量的值（save 和data）
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_15

	implicit none

	! 函数定义
   integer(4)  save_save, save_data

!--- 注意函数返回后，函数中变量的值是否保留 ---
!    Visual Fortran 中内部变量缺省是SAVE的。
!  所以一定要养成给变量赋初值的习惯!!!

   ! 没有用data赋初值的变量
	print *, 'sum1 = ', save_save()
   print *, 'sum2 = ', save_save()
   print *
  
   ! 用data赋初值的变量
	print *, 'sum1 = ', save_data()
   print *, 'sum2 = ', save_data()
   print *

	end program exam_8_15

!====================================
! 变量的save属性（Visual Fortran中只要
!是内部变量就是save的）
!====================================
   integer(4) function save_save()
   implicit none
   integer(4) i
!   integer(4), save:: sn = 0 ! save 作为一种变量属性
!   integer(4):: sn = 0
   integer(4):: sn

   save sn        ! save 也可以作为一个单独的说明语句

   ! 一定要养成给变量赋初值的习惯!!!
   !sn = 0

   do i = 1, 10
      sn = sn + i
   enddo
   
   save_save = sn

   end   

!====================================
! 用data赋值的变量一定是save属性的
!====================================
   integer(4) function save_data()
   implicit none
   integer(4) i
  integer(4), save:: sn
 !  integer(4) sn

   data sn /1/

   ! 一定要养成给变量赋初值的习惯!!!
   !sn = 0

   do i = 1, 10
      sn = sn + i
   enddo
   
   save_data = sn

   end