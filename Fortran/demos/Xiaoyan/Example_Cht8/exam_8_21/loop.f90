!****************************************************************************
!
!  SUBROUTINE: loop
!
!  PURPOSE: 和C语言混合编程示例（供C语言调用）
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 17, 2006
!  MODIFIED: Nov.  16, 2010
!****************************************************************************

	subroutine loop(n, a)

	implicit none

	! 变量定义
   integer(4), intent(in):: n           ! 循环次数
   real(8), intent(out)::   a(n)        ! 工作数组
   integer(4)  i, j                     ! 循环变量

!--- 进行n*(n+1)/2次循环 ---
   do i = 1, n
      do j = i, n
         a(i) = sin(sqrt(dble(i))) * cos(sqrt(dble(j)))
      enddo
   enddo	

	end subroutine loop

