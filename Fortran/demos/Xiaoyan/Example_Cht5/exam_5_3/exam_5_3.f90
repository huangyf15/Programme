!****************************************************************************
!
!  PROGRAM: exam_5_3
!
!  PURPOSE: 改变循环流程的语句示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 4, 2006
!****************************************************************************

	program exam_5_3

	implicit none

	! 变量定义
   integer(4)  i, j

	! exit:  跳出本循环单元
   ! cycle: 立即进行下一次循环
   Loop1: do i = 1, 3	
      	      
   Loop2:   do j = 1, 3
               !if(i + j .eq. 3) exit
               !if(i + j .eq. 3) exit loop1
               !if(i + j .eq. 3) cycle
               if(i + j .eq. 3) cycle loop1

               print *, 'i = ', i, ' j = ', j
            enddo Loop2
            
            print *, 'i = ', i
            print *
          enddo Loop1

	end program exam_5_3

