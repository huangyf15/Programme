!****************************************************************************
!
!  PROGRAM: exam_15_1
!
!  PURPOSE: L2 Cache的作用
!  
!  PROGRAMMER: 向志海
!
!  DATE:      May 29, 2006
!  MODIFIED: June 12, 2007
!            June 10, 2010
!****************************************************************************

	program exam_15_1

	implicit none

	! 变量定义
   integer(4), parameter :: kbyte = 256         !  1K Bytes的整数
   integer(4), parameter :: mbyte = 262144      !  1M Bytes的整数
   integer(4), parameter :: m30   = mbyte * 30  ! 30M Bytes的整数
   real(4)    start              ! 记录起始时刻
   real(4)    rand               ! 随机数
   integer(4) s
   integer(4) i, j, k            ! 循环变量
   integer(4) a(1:m30)           ! 30M Bytes的整数数组
   integer(4) b(1:mbyte)         !  1M Bytes的整数数组
   integer(4) c(30,kbyte,kbyte)  ! 30M Bytes的整数数组

!--- 产生30M Bytes的随机数给数组赋值，并记录耗费的时间  ---
   call random_seed()

   ! 数组大小超过6M（L2 Cache容量，因CPU而异）
   start = secnds(0.0)
	do i = 1, m30
      call random_number(rand)
      a(rand * (m30-1)+1) = i
   enddo
   print *, 'Time a: ', secnds(0.0) - start

   ! 数组大小不超过6M（L2 Cache容量，因CPU而异）
   start = secnds(0.0)
   do j = 1, 30
	   do i = 1, mbyte
         call random_number(rand)
         b(rand * (mbyte-1)+1) = i
      enddo
   enddo
   print *, 'Time b: ', secnds(0.0) - start
   print *

!--- 用不同的算法求数组元素的和，并记录耗费的时间  ---
   ! 数组大小超过6M（L2 Cache容量，因CPU而异）
   s     = 0
   start = secnds(0.0)
	do i = 1, 30
      do j = 1, kbyte
         do k = 1, kbyte
            s = s + c(i,j,k)
         enddo
      enddo
   enddo
   print *, 'Time c1: ', secnds(0.0) - start   
   print *

   ! 数组大小不超过6M（L2 Cache容量，因CPU而异）
   s     = 0
   start = secnds(0.0)
	do k = 1, kbyte
      do j = 1, kbyte
         do i = 1, 30
            s = s + c(i,j,k)
         enddo
      enddo
   enddo
   print *, 'Time c2: ', secnds(0.0) - start
   print *

   ! 内部函数进行了优化
   start = secnds(0.0)
   s     = sum(c)
   print *, 'Time c3: ', secnds(0.0) - start

 	end program exam_15_1

