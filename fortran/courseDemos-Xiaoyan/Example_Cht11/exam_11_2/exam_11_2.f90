!****************************************************************************
!
!  PROGRAM: exam_11_2
!
!  PURPOSE: 公用区示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_2

	implicit none

!--- 变量定义 ---
   integer(2)                a
   integer(4), target     :: b, c(3)
   real(4)                   x, y, z(4)
   character(7)              ch
   integer(4), pointer    :: p, pa(:)
   integer(4), allocatable:: at(:)

   ! 无名公用区（只能有一个）
   common c, x(2), a          ! 在公用区中可以声明数组变量 x(2)
                              ! 已声明的数组变量在公用区中只能出现数组名 c
   
   ! 有名公用区
   common /data1/ b, z                 ! 可以分成多个common语句书写
   common /data1/ ch /data2/ y, p, pa  ! 一条common语句可以声明多个公用区

!   common /data3/ at                   ! 公用区中不能包含大小不定的变量
   

!--- 公用区使用示例 ---
   ! 给变量赋初值
	a = 1
   b = 2
   c = (/3:5/)
   x = 6.0
   y = 7.0
   data z /8.0, 9.0, 10.0, 11.0/
   ch = 'Fortran'

   p  => b
   pa => c

   ! 用公用区传递变量
   call output

	end program exam_11_2


!====================================
!  输出公用区中变量的值
!====================================
   subroutine output
   implicit none

   integer(2)                a
   integer(4), target     :: b, c(3)
   real(4)                   x, y, z(4)
   character(7)              ch
   integer(4), pointer    :: p, pa(:)
   integer(4), allocatable:: at(:)

   common c, x(2), a
   common /data1/ b, z, ch
   common /data2/ y, p, pa

!  common /data1/ z, b, ch    ! 注意变量的排列顺序
   

   print *, 'a  = ', a
   print *, 'b  = ', b
   print *, 'c  = ', c
   print *, 'x  = ', x
   print *, 'y  = ', y
   print *, 'z  = ', z
   print *, 'ch = ', ch
   print *, 'p  = ', p
   print *, 'pa = ', pa

   end

