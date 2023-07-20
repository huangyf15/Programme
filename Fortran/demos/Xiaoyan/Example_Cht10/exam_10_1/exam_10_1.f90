!****************************************************************************
!
!  PROGRAM: exam_10_1
!
!  PURPOSE: 指针的基本操作示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 24, 2006
!****************************************************************************

	program exam_10_1

	implicit none

	! 变量定义
   integer(4), target ::  a = 1
   integer(4), pointer::  p1, p2 => null()   ! 初始化指针为“空”

!--- 指针的不同状态 ---
	print *, 'p1 associate state: ', associated(p1)
   print *, 'p2 associate state: ', associated(p2)
   print *

!-----只有具有关联状态的指针才能被访问（赋值或引用），对非关联状态指针进行访问，将发生错误。

   !print *, p2   ! 此指针还未关联!!!


   ! 指针变量作为别名
   p1 => a
   p2 => p1    ! A pointer has intrinsic 'target' attribute

	print *, 'p1 associate state: ', associated(p1)
   print *, 'p2 associate state: ', associated(p2)
   print *, 'p2 associate a    : ', associated(p2, a)
   print *

   print *, 'p1 = ', p1, ' p2 = ', p2
   
   !a=2
   p2 = p1 * 2

   print *, 'p1 = ', p1, ' p2 = ', p2, ' a = ', a
   print *

   nullify(p1)
	print *, 'p1 associate state: ', associated(p1)
	print *, 'p2 associate state p1: ', associated(p2,p1)
	print *, 'p2 associate state a: ', associated(p2,a)

	end program exam_10_1