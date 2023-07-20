!****************************************************************************
!
!  PROGRAM: exam_6_6
!
!  PURPOSE: 纵向走纸控制示例 
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 12, 2006
!****************************************************************************

	program exam_6_6
   
	implicit none

	! 变量定义
   integer(4) i

! Check "Project/Settings/Fortran/Compatibility/PowerStation4.0 Compatibility/
!        Other Run-time Behaviour"
   ! 空格：移到下一行开头
	write(*,10) 123
10 format(1x, i3)

	write(*,20) 123
20 format(' ',i3)

   ! 0：移到下两行开头
	write(*,30) 123
30 format('0',i3)

	write(*,40) '023'
40 format(a)

   ! +：移到当前行开头
   print *
   print *
   do i = 1, 10
      write(*,50) i
      call sleepqq(1000)   !延时1秒。 Visual Fortran 内部函数，非标准
   enddo
50 format('+', 'i = ', i2)
!50 format( 'i = ', i2)


	end program exam_6_6

