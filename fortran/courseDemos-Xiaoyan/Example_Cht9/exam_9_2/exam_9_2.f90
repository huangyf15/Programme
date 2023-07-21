!****************************************************************************
!
!  PROGRAM: exam_9_2
!
!  PURPOSE: 派生类型和子程序的关系
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 24, 2006
!  Modified: May   14, 2010
!****************************************************************************

	program exam_9_2

	implicit none

!--- 课程派生类型定义 ---
   type course
      character(9)  name           
      integer(4)    credit
      real(4) ::    score = 0.0    ! 缺省初始化
   end type

!--- 结构体变量定义 ---
   type(course) c
   type(course) input_ext

!--- 调用返回结构体的内部函数 ---
   c = input()
	print *, 'Course(internal): ', c
   print *

!--- 调用返回结构体的外部函数 ---
   c = input_ext()
	print *, 'Course(external): ', c
   print *

!--- 派生类型作为实参 ---
   call output(c)

   print *, 'Course(changed) : ', c

   contains
   !====================================
   ! 返回结构体的函数
   !====================================
      type(course) function input()
      implicit none

      print *, "Please input 'name', 'credit' and 'score' to initiate a course (internal)"
      read *, input
      
      end function

	end program exam_9_2

!=====================================
! 外部函数的声明可以放在主程序后
!=====================================
   function input_ext()
   implicit none

!--- 这里必须再一次定义课程派生类型 ---
   type course
      character(9)  name           
      integer(4)    credit
      real(4) ::    score = 0.0    ! 缺省初始化
   end type

   type(course) input_ext

   print *, "Please input 'name', 'credit' and 'score' to initiate a course (external)"
   read *, input_ext
      
   end function

!=====================================
! 外部子例行程序的声明可以放在主程序后
!=====================================
   subroutine output(c)
   implicit none

!--- 这里必须再一次定义课程派生类型 ---
   type course
      character(9)  name           
      integer(4)    credit
      real(4) ::    score = 0.0    ! 缺省初始化
   end type

!--- 结构体作为形参 ---
   type(course), intent(inout):: c

   print *, 'Course(output)  : ', c
   print *

   c = course('changed', 3, 0.0)
   
   end
