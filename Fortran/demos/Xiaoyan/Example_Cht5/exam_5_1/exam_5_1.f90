!****************************************************************************
!
!  PROGRAM: exam_5_1
!
!  PURPOSE: if语句示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 4, 2006
!  Modified by Xiaoyan Li, on Oct. 29, 2014
!****************************************************************************

	program exam_5_1

	implicit none

	! 变量定义
	integer  m, s
	real(4)  a
	real(4)  b
	real(4)  c
	real(4)  max

	!块if
	!输入一个整数
	print *, 'Please input a integer: '
	read *, m

	if (mod(m,2).eq.0) then
		print *, m, 'is a even number!'
	else
		print *, m, 'is a odd number!'
	endif

	print *


	!select case
	!输入一个整数
	print *, '输入学生的成绩：'
	read *, s
	select case (s)
	case (90:100)
		print *,'该学生的成绩为：优'
	case (80:89)
		print *,'该学生的成绩为：良'
	case (70:79)
		print *,'该学生的成绩为：中'
	case (60:69)
		print *,'该学生的成绩为：及格'
	case (0:59)
		print *,'该学生的成绩为：不及格'
	case default
		print *,'该学生的成绩不正确。'
	end select

	print *
	
	!嵌套块if
	! 输入三个实数
	print *, 'Please input three real numbers:'
	read *, a, b, c

	! 把三个数从大到小进行排序输出
ab:   if(a .gt. b) then
ac1:     if(a .gt. c) then
bc:         if(b .gt. c) then
               print *, a, b, c
            else
               print *, a, c, b
            endif bc
         else
            print *, c, a, b
         endif ac1
      else ab
cb:      if(c .gt. b) then
            print *, c, b, a
         else
ac2:        if(a .gt. c) then
              print *, b, a, c
            else ac2
               print *, b, c, a
            endif ac2
         endif cb
      endif ab

   ! 输出最大的数
	max = a
	if(max .lt. b) max = b
	if(max .lt. c) max = c
	print *, 'max = ', max

	end program exam_5_1

