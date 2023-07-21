!****************************************************************************
!
!  PROGRAM: exam_8_18
!
!  PURPOSE: 操作符重载
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 11, 2006
!  MODIFIED: Nov.  27, 2011
!****************************************************************************

	program exam_8_18
 
	implicit none

   ! 重载'+'操作符
   interface operator(+)
      function add_string(c1, c2)
      implicit none
      character(*), intent(in):: c1, c2
      character(len_trim(c1)+len_trim(c2)) add_string
!      character(len(c1)+len(c2)) add_string ! 试试看
      end
   end interface

   ! 自定义逆向排列操作符
   interface operator(.reverse.)
      function rev(a)
      implicit none
      integer(4), intent(in):: a(:)
      integer(4) rev(ubound(a,1))
      end
   end interface

   ! 重载'.gt.'操作符
   interface operator(.gt.)
      function cmp(c1, c2)
      implicit none
      character(*), intent(in):: c1, c2
      logical cmp
      end
   end interface

	! 变量定义
   character(15)  c1, c2
   integer(4)     a(4)

	! 给变量赋初值
   c1 = "Programing"
   c2 = " is fun!"
   a  = [1:4]
	
!--- 两个字符串相加 ---
   ! 用内部操作符
   print *, 'string: ', c1 // c2, ' length = ', len(c1 // c2)

   ! 用重载操作符
   print *, 'string: ', c1 + c2, ' length = ', len(c1 + c2)

   print *, char(56) + 'a'

   ! 直接用自定义函数
   print *, 'string: ', add_string(c1, c2), ' length = ', len(add_string(c1, c2))
   print *

!--- 将数组元素逆向排列 ---
   print *, 'The original data : ', a
   print *, 'The resultant data: ', .reverse. a
   print *

!--- 比较两个字符串的长度 ---
   ! 用重载的操作符
   print *, "Language" .gt. "Program"

   ! 重载'.gt.'相当于重载'>'
   print *, "Language" > "Program"

	end program exam_8_18

!====================================
! 将两个字符串相加，并且去掉尾部空格
!====================================
   function add_string(c1, c2)
   implicit none
   character(*), intent(in):: c1, c2
   character(len_trim(c1)+len_trim(c2)) add_string

   add_string = trim(c1) // trim(c2)

   end

!====================================
! 将数组元素逆向排列
!====================================
   function rev(a)
   implicit none
   integer(4), intent(in):: a(:)
   integer(4) rev(ubound(a,1))

   rev(1:ubound(a,1)) = a(ubound(a,1):1:-1)
   
   end 

!====================================
! 比较两个字符串的长度
!====================================
   function cmp(c1, c2)
   implicit none
   character(*), intent(in):: c1, c2
   logical cmp

   cmp = .false.
   if(len_trim(c1) .gt. len_trim(c2)) cmp = .true.

   end
