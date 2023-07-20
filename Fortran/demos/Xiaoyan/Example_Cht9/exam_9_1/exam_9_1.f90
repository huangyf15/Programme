!****************************************************************************
!
!  PROGRAM: exam_9_1
!
!  PURPOSE: 派生类型的基本操作示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_9_1

	implicit none

!--- 派生类型定义 ---
   ! 课程类型
   type course
      !sequence                      ! 使成员存储时的顺序和定义时一样，而且在内存中连续存放
      character(9)   name           ! Pay attention to the alignment
      integer(4)     credit
      real(4) ::     score = 0.0    ! 缺省初始化
   end type

   ! 学生类型
   type student_info
      character(10)  name
      ! 用构造函数做缺省初始化工作
      type(course) :: scores(2) = course('English', 4, 85.0)
      ! Fortran2003才允许可分配数组作为派生类型成员
 !     integer(4), allocatable :: a(:)
   end type

!--- 变量定义 ---
   ! 结构体变量定义
   type(course)::       fortran = course('Fortran', 2, 90.0) ! 用构造函数初始化
   type(student_info)   dem(3)                               ! 结构体数组
   integer(4)           i


!--- 结构体的大小和sequence相关 ---
!    如无sequence，则所占的存储空间为四个字节（32位系统）的整数倍
   print *, 'sizeof(fortran) = ', sizeof(fortran)
   print *

!--- 结构体的赋值 ---
   ! 按成员函数单独赋值
   dem(1)%name             = '张三'
   dem(1)%scores(1)%name   = 'Calculus'               ! 会覆盖掉缺省值
   dem(1)%scores(1)%credit = 3 


   !dem(2)%name      = '李四'
   !dem(2)%scores(1) = course('Physics', 3, 70.0)      ! 用构造函数赋值 
   !data dem(2)%scores(2) /course('Fortran', 2, 85.0)/ ! 用data语句初始化

   data dem(2) /student_info('王五', course('Fortran', 2, 85.0))/


   ! 结构体整体赋值
   dem(3) = dem(1)

!--- 结构体的输出（输入与此相似，省略） ---
   ! 整体输出，顺序按派生类型定义时的顺序
   print *, fortran
   print *

   ! 单个成员输出
   do i = 1, 3
      print 10, dem(i)
   enddo
10 format(a, 2(3x, a, i3, f7.1)/)

	end program exam_9_1

