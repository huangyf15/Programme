!****************************************************************************
!
!  PROGRAM: exam_8_19
!
!  PURPOSE: 赋值号重载
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 11, 2006
!****************************************************************************

	program exam_8_19

	implicit none

   ! 重载'='以定义新的转换规则，注意变量类型一定要一致
   interface assignment(=)
      subroutine log_to_int(i, l)
      implicit none
!     logical(1), intent(in):: l
      logical, intent(in):: l
      integer(4), intent(out):: i
      end
   end interface

	! 变量定义
   integer(4) i

!--- 将逻辑型量转换成整数型量 ---
	i = .true.
   print *, i

   i = .false.
   print *, i

	end program exam_8_19

!====================================
! 将逻辑型量转换成整数型量
!====================================
   subroutine log_to_int(i, l)
   implicit none
 !  logical(1), intent(in):: l
   logical, intent(in):: l
   integer(4), intent(out):: i

   i = 0
   if(l) i = 1

   end

