!****************************************************************************
!
!  PROGRAM: exam_8_14
!
!  PURPOSE: 子程序作为形参
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 10, 2006
!  MODIFIED: April 17, 2007
!            Nov.  25, 2010
!            April 19, 2013
!****************************************************************************

	program exam_8_14

	implicit none

!--- 声明实参子程序 ---
   ! 用户定义的子程序声明为外部的，才能够作为实参
   integer(4), external:: add
   external  wrt

   ! 系统子程序声明为内部的，才能够作为实参
   intrinsic mod

!--- 子程序作为实参 ---
   call prn(1, 2, wrt, add)

   call prn(1, 2, wrt, mod)

	end program exam_8_14

!====================================
! 函数形参必须声明，但子例行程序形参
! 不用说明（不是变量）
!====================================
   subroutine prn(a, b, sub, fun)
   implicit none
   
   interface
      integer(4) function xfun(a, fun)
      integer(4), intent(in) :: a(:)
      integer(4), external:: fun ! 必须声明为external才能被prn程序中的xfun所使用
      ! integer(4) fun
      end
   end interface

   integer(4), intent(in) :: a, b
   integer(4), external:: fun       ! 作为xfun的实参，这里也必须用external
   integer(4) :: array(2) = [3, 4]

   call sub(a, b)    ! 因为不需要将sub作为实参传递给其他子程序，所以不用声明为external

   write(*,*) 'result(fun) = ', fun(a, b)
   print *

   write(*,*) 'result(:)   = ', xfun(array,fun)

   end

!====================================
! 可以自己定义子例行程序作为实参，但
! 要在主程序中声明为外部的（external）
!====================================
   subroutine wrt(a, b)
	implicit none
	integer(4), intent(in):: a, b

	write(*,*) 'a = ', a, ' b = ', b
   
   end subroutine wrt

!====================================
! 可以自己定义函数作为实参，但要在主
! 程序中声明为外部的（external）
!====================================
   integer(4) function add(a, b)
   integer(4), intent(in) :: a, b

   add = a + b

   end

!====================================
! 可以自己定义函数作为实参，但要在主
! 程序中声明为外部的（external）
!====================================
   integer(4) function xfun(a, fun)
   integer(4), intent(in) :: a(:)
   integer(4) fun ! 因为不需要将fun作为实参传递给其他子程序，所以不用声明为external

   xfun = fun(a(1), a(2))

   end