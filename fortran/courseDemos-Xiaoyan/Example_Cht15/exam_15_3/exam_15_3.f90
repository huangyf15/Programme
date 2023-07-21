!****************************************************************************
!
!  PROGRAM: exam_15_3
!
!  PURPOSE: Hoisting示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 29, 2006
!****************************************************************************

	program exam_15_3

	implicit none

	! 变量定义
   integer(4) i, j   ! 循环变量
   integer(4) k      ! 工作变量

!--- 需要hoisting的情况 ---
	do i = 1, 100
      do j = 1, 100
         k = i * 2            ! 此语句应该放在上一层循环中
         print *, j * k
      enddo
   enddo

   do i = 1, 100
      do j = 1, 100
         if(i .gt. 20) then   ! 此判断应该放在上一层循环中
            k = j * 2
         else
            k = j * 3
         endif
      enddo
   enddo
      
	end program exam_15_3

