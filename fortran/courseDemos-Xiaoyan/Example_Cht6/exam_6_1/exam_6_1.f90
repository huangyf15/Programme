!****************************************************************************
!
!  PROGRAM: exam_6_1
!
!  PURPOSE: 表控格式和内部记录示例 
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March 12, 2006
!  MODIFIED: March 27, 2007
!****************************************************************************

	program exam_6_1

	implicit none

	! 变量定义
   integer(4)      i
   real(4)         a
   character(80):: in = "1.2, 2"
   character(80)   out



   ! 从缺省设备（键盘）中读入数据，并向缺省设备（屏幕）回显
   read *, i
   !read(5,*) i
   print *, 'Echo: ', i
   !write(6,*) i
   print *

   ! 从内部记录中按表控格式读入数据
   read(in,*) i, a

   ! 向屏幕输出数据
   print *, i, a

   ! 向内部记录中输出数据
   write(out,*) i, a

   ! 向屏幕输出内部记录
   write(*,*) out

	

	end program exam_6_1

