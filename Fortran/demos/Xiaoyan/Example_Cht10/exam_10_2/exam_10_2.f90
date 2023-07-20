!****************************************************************************
!
!  PROGRAM: exam_10_2
!
!  PURPOSE: 指针作为别名示例—选择排序操作
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_10_2

	implicit none
   
!--- 派生类型定义 ---
   ! 课程类型
   type course
      character(9)   name
      integer(4)     credit
      real(4)        score
   end type

   ! 学生类型
   type student_info
      character(9)  name
      real(4)       avg
      type(course)  scores(2)
   end type

   ! 指向student_info结构体的指针
   type student_link
      type(student_info), pointer:: p_student
   end type

!--- 变量定义 ---
   ! 结构体变量定义
   type(student_info), target::  students(5) ! 结构体数组
   type(student_info), pointer:: p_student   ! 工作指针
   type(student_link)            rank(5)     ! 指针数组
   integer(4)  i, j, index

!--- 初始化学生信息 ---
   ! 给学生赋名字
   students(1)%name = '张三'
   students(2)%name = '李四'
   students(3)%name = '熊二'
   students(4)%name = '何维'
   students(5)%name = '李白'

   ! 根据运行的时刻产生随机数种子
   call random_seed()

   do i = 1, 5
      ! 产生学生成绩
      students(i)%scores(1) = course('English', 4, score())
      students(i)%scores(2) = course('Calculus', 4, score())
      students(i)%avg       = (students(i)%scores(1)%score +&
                               students(i)%scores(2)%score) / 2.0

      ! 初始化排名信息
      rank(i)%p_student => students(i)
   enddo

   call out('Original info:')

!--- 按两门课的平均成绩从大到小进行排序 ---
   do i = 1, 4
      index = i
      do j = i, 5
         if(rank(index)%p_student%avg .lt. rank(j)%p_student%avg) index = j
      enddo

      ! 这样可以避免拷贝大量数据
      if(index .ne. i) then
         p_student             => rank(i)%p_student
         rank(i)%p_student     => rank(index)%p_student
         rank(index)%p_student => p_student
      endif
   enddo
         
   call out('Final rank:')

   contains
      !====================================
      ! 按正态分布产生成绩，平均成绩85分，标准方差5分
      !====================================
      real(4) function score()
      real(4), parameter:: pi2 = 3.1415926 * 2.0
      real(4) r1, r2
      
      call random_number(r1)
      call random_number(r2)
      score = 85.0 + 5.0 * sin(pi2 * r1) * sqrt(-2.0 * log(r2))
      
      end function

      !====================================
      ! 打印学生成绩
      !====================================
      subroutine out(banner)
      character(*) banner
      type(student_info), pointer:: p_student   ! 工作指针

      print *, banner

      print *, '姓名', '  平均成绩', '  English', '  Calculus' 
      print *, '---------------------------------'

      do i = 1, 5
         p_student => rank(i)%p_student
         print 10, trim(p_student%name), p_student%avg,&
                   p_student%scores(1)%score, p_student%scores(2)%score 
      enddo
      print *

10    format(1x, a, 4x, f4.1, 6x, f4.1, 5x, f4.1)

      end subroutine
         
	end program exam_10_2