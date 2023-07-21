!****************************************************************************
!
!  PROGRAM: exam_4_2
!
!  PURPOSE: 名称规则示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:     Feb. 28, 2006
!  MODIFIED: Oct. 21, 2010
!****************************************************************************

	program exam_4_2

	implicit none
   integer:: $total = 1
   integer:: A_name_made_up_of_more_than_31_letters = 2
   integer aaa
   !integer:: _program = 3

   aaa=2
   print *, aaa

	! 可以用$开头（非标准用法，和Compaq Visual Fortran的历史有关）
   print *, $total
   print *
	
   ! Visual Fortran 中的名称长度可达63个字符
   print *, 'A long name:'
   print *, A_name_made_up_of_more_than_31_letters


	end program exam_4_2

