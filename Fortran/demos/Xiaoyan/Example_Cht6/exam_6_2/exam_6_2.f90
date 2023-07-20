!****************************************************************************
!
!  PROGRAM: exam_6_2
!
!  PURPOSE: 显式格式的两种表达方式 
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 12, 2006
!****************************************************************************

	program exam_6_2

	implicit none

	! 变量定义
   integer(4)::    i   = 1
   character(20):: out = "(1x, 'i = ', i3)"

	! 表控格式
   print *, i + 2
   print *

   write(*,*) i + 2
   write(*,*)

   ! 显式格式
   write(*,10) i + 2                      ! 按默认位置
   write(*,*)
10 format(1x, 'i = ', i3)

   write(fmt = 10, unit = *) i + 2        ! 位置可以显式指定
   write(*,*)

   write(*, "(1x, 'i = ', i3)") i + 2     ! 另外一种表示方式
   write(*,*)

   write(fmt = '(1x, "i = ", i3)', unit = 6) i + 2
   write(*,*)

   write(*, '()')                         ! 输出空行

   write(*, out) i + 2                    ! 变量也可以作为格式

	end program exam_6_2

