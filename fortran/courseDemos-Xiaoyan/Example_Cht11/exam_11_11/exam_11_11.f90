!****************************************************************************
!
!  PROGRAM: exam_11_11
!
!  PURPOSE: 用模块实现数据重用，并保证数据一致性（参看exam_9_2）
!  
!  PROGRAMMER: 向志海
!
!  DATE:     May 22, 2007
!  MODIFIED: May 20, 2010
!****************************************************************************

	program exam_11_11

   use course_type

	implicit none

!--- 使用了假设形状的数组，所以要用interface说明 ---
   interface
      subroutine output(c)
      use course_type
      implicit none
!      type course
!         character(9)  name           
!         integer(4)    credit
!         real(4) ::    score = 0.0    ! 缺省初始化
!      end type

      type(course), intent(inout):: c(:)
      end
   end interface

!--- 课程派生类型定义 ---
!   type course
!      character(9)  name           
!      integer(4)    credit
!      real(4) ::    score = 0.0    ! 缺省初始化
!   end type

!--- 结构体变量定义 ---
   type(course) c(2)


!--- 调用返回结构体的函数 ---
   c(1) = input()
   c(2) = input()
	print *, 'Course(original): ', c
   print *

   call output(c)

   print *, 'Course(changed) : ', c

   contains
   !====================================
   ! 返回结构体的函数
   !====================================
      type(course) function input()
      implicit none

      print *, "Please input 'name', 'credit' and 'score' to initiate a course"
      read *, input
      
      end function

	end program exam_11_11


!=====================================
! 外部子例行程序的声明可以放在主程序后
!=====================================
   subroutine output(c)
   use course_type
   implicit none

!--- 编译程序认为定义的课程派生类型和主程序中的课程派生类型不是同一个东西 ---
!   type course
!      character(9)  name           
!      integer(4)    credit
!      real(4) ::    score = 0.0    ! 缺省初始化
!   end type

   type(course), intent(inout):: c(:)
   integer(4)                    i

   do i = 1, size(c)
      print *, 'Course(output)  : ', c(i)
      print *
      c = course('changed', 3, 0.0)
   enddo

	end

