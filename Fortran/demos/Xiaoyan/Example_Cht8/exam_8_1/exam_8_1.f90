!****************************************************************************
!
!  PROGRAM: exam_8_1
!
!  PURPOSE: 外部函数示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 3, 2006
!****************************************************************************

!====================================
! 外部函数申明可以放在主程序前
!====================================
   real(4) function add(x, y)
   
   implicit none  
   real(4) x, y

   ! 返回值是函数名
   add = x + y

   end

!====================================
! 主程序
!====================================
	program exam_8_1

	implicit none

   ! 返回数组的函数必须用interface声明
   interface
      function mul_array(x, y)
      implicit none
      real(4) x(2,2), y(2,2)
      real(4) mul_array(2,2)
      end
   end interface
	
   ! 变量声明
   real(4)  a, b, c(2,2), d(2,2)

   ! 函数声明
   real(4)    add, sub, sec
   integer(4) factorial
         
   a = 1.0
   b = 2.0
   c = 1.5
   d = 3.0

!--- 函数调用 ---   
   print *, 'a + b = ', add(a, b)
   print *, 'a - b = ', sub(a, b)
   
   ! 没有参数也要加括号，表示这是一个函数而不是一个普通变量
   print *, 'time  = ', sec()

   ! 返回数组的函数必须用interface声明
   print *, 'c * d = ', mul_array(c, d)

   ! 调用一个递归函数。link时只要在project中能找到相应的obj文件即可
   print *, '5!    = ', factorial(5)
   
	end program exam_8_1

!====================================
! 外部函数申明可以放在主程序后
!====================================
   real(8) function sub(x, y)
   implicit none
   real(4) x, y

   ! 返回值是函数名
   sub = x - y

   end function sub

!====================================
! 没有参数也要加括号
!====================================
   real(4) function sec()
   
   ! 返回值是函数名
   sec = secnds(0.0)    ! 返回从午夜开始到调用这个函数的时刻所经过的时间，精确到0.01秒

   end

!====================================
! 函数说明的另外一种形式
!====================================
   function mul_array(x, y)
   implicit none
   real(4) x(2,2), y(2,2)
   real(4) mul_array(2,2)  ! 可以返回一个数组

   mul_array = matmul(x, y)

   end