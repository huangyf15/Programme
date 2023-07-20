!****************************************************************************
!
!  PROGRAM: exam_7_10
!
!  PURPOSE: 可分配数组示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March 21, 2006
!  MODIFIED: April 15, 2009
!****************************************************************************

	program exam_7_10

	implicit none

	! 变量定义
   integer(4)  i, err
   integer(4), allocatable:: a(:)   ! 可分配数组说明时一定要用:说明维数

!--- 分配数组空间 ---
	print *, 'Please input the dimension of array a'
   read *, i

   ! err == 0 才是正常的
   allocate(a(i), stat = err)
   if(err .ne. 0) stop 'Array allocation error!'

   a = 1
   print *, 'a = ', a

!--- 不能重复分配 ---
   allocate(a(3), stat = err)
   if(err .ne. 0) then
      print *, 'Array allocated: ', allocated(a)
      stop 'Array reallocated!'
   endif

!--- 释放数组空间后数组无意义 ---
   a = 2
   print *, 'a = ', a

   deallocate(a)

!   print *, 'a = ', a

	end program exam_7_10

