!****************************************************************************
!
!  PROGRAM: exam_8_8
!
!  PURPOSE: 静态显式数组作为形参
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_8

	implicit none

	! 变量定义
   integer(4)                a(6), b(2,3), c(3,3)
   character(*), parameter:: ch(5) = (/'1111', '2222', '3333', '4444', '5555'/)

!--- 给数组变量赋初值 ---
   a = (/1:6/)
   b = reshape((/6:1:-1/),shape(b))
   c = reshape((/1:9/),shape(c))

   call list('*** Original data ***')

!--- 实参数组名相当于该数组的起始地址 ---
   call sub1(a, b)
   
   call sub1(c(1,1), c(2,1))

   call list('*** After called sub1 ***')

   ! 字符串数组
   call sub2(ch)

   contains
      !====================================
      ! 打印所有的数组
      !====================================
      subroutine list(banner)
      implicit none
      character(*), intent(in):: banner
      integer(4)   i, j
   
      print *, banner

      print *, 'a:'
      print *, a
 
      print *, 'b:'
      do i = 1, 2
         print *, (b(i,j), j = 1, 3)
      enddo
	
      print *, 'c:'
      do i = 1, 3
         print *, (c(i,j), j = 1, 3)
      enddo
      print *

      end subroutine

	end program exam_8_8

!====================================
! 注意数组元素是按列排列
!====================================
   subroutine sub1(x, y)
   implicit none
   integer(4) x(2,3), y(6)
   integer(4) i, j

   print *, 'x:'
   do i = 1, 2
      print *, (x(i,j), j = 1, 3)
   enddo

   print *, 'y:'
   print *, (y(i), i = 1, 6)  ! 越界，但不报错。很危险
   print *

   ! 数组也是按地址传递
   x = 0
   y = 1

   end

!====================================
! 字符串数组相当于一个长的字符串，
! 每一个数组元素相当于一个子字符串。
!(2014.4.22加)实在数组的所有数组元素
!按存储次序组成一个长字符串与形式数组所有元素组成的字符串进行结合
!====================================
   subroutine sub2(ch)
   implicit none
   character(5)  ch(4)
   integer(4)    i

   do i = 1, 4
      print *, ch(i)
   enddo

   end
