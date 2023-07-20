!****************************************************************************
!
!  PROGRAM: exam_10_4
!
!  PURPOSE: 动态分配内存示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_10_4

	implicit none
   
 !--- 派生类型定义 ---
   type row
      integer(4), pointer:: r(:)    ! 指向一维整型数组的指针
   end type

!--- 变量定义 ---
   integer(4), parameter:: n = 4
   type(row)               a(n)     ! 指针数组
   integer(4)              i, j     ! 循环变量
   integer(4)              err      ! 错误标识

!--- 产生与指针数组各元素对应的一维数组 ---
   do i = 1, n
      allocate(a(i)%r(1:i), stat = err)
      if(err .eq. 0) then
         a(i)%r = i
      else
         print *, 'Memery allocation error, i = ', i, ' stat = ', err
         stop
      end if
   end do

   ! 对指针数组不能进行整体输出
!   print *, a
   
   ! 打印数组值，并释放内存空间
   do i = 1, n
      print *, (a(i)%r(j), j = 1, i)
      deallocate(a(i)%r, stat = err)
      if(err .ne. 0) then
         print *, 'Memery deallocation error, i = ', i, ' stat = ', err
         stop
      end if
   enddo

	end program exam_10_4