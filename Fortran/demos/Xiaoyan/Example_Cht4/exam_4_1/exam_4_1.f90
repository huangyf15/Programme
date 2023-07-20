!****************************************************************************
!
!  PROGRAM: exam_4_1
!
!  PURPOSE: 自由格式示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:     Feb.  28, 2006
!  MODIFIED: March 12, 2010
!****************************************************************************

	program exam_4_1

	implicit none

! 这一行超过了132个字符
   print *,                                                                                                                      "It's OK!"
   print *

! &的第一种用法
   print *, 'tr&
            ue'  ;      print *

   print *, 10 * 100&
            0
      
   print *

! &的另一种用法
   print *, 'true&
            & or false?'
      
   print *

   print *, 10 * 100&
            &0

	end program exam_4_1

