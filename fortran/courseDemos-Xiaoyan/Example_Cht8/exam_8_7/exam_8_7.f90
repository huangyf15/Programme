!****************************************************************************
!
!  PROGRAM: exam_8_7
!
!  PURPOSE: 字符变量作为形参
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 4, 2006
!****************************************************************************

	program exam_8_7

	implicit none

   ! 这样编译程序才能知道这个字符串型函数的长度
   interface
      function my_trim(char)
      implicit none
      character(*) char
      character(len_trim(adjustl(char))) my_trim
      end
   end interface

	! 变量定义
   character(20):: banner = 'Programming is fun!'

   ! 调用假定长度字符串函数时必须声明为一个确定的长度
   character(20)   int2char

!--- 输出字符变量 ---
   call prn(banner)

   call prn(banner(13:))

   ! 将整数转换为字符串
   print *, int2char(1234)

   ! 去掉开头和末尾的空格
   print *, my_trim('    5678   ')

	end program exam_8_7

!====================================
! 字符变量作为形参时要注意其长度
!====================================
   subroutine prn(banner)
   implicit none
!   character(10) banner
   ! 假设长度的字符串形参
   character(*) banner       ! Assumed length character argument

   print *, banner, '        string length = ', len(banner)

   end

!====================================
! 函数的类型可以是假设长度的字符串，
! 但调用时必须声明为一个确定的长度，
! 不同的程序模块声明的长度可以不同
!====================================
   character(*) function int2char(number)
   implicit none
   integer(4), intent(in):: number

   ! 这种方法可以适用于实数
   write(int2char,*) number
   
   ! 去掉开始的空格
   int2char = adjustl(int2char)

   end

!====================================
! 去掉开头和末尾的空格
!====================================
   function my_trim(char)
   implicit none
   character(*) char
   ! 这样函数的长度是确定的，但必须用interface显式声明
   character(len_trim(adjustl(char))) my_trim

   my_trim = trim(adjustl(char))

   end