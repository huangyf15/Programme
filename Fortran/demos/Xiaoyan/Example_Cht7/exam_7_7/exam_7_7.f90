!****************************************************************************
!
!  PROGRAM: exam_7_7
!
!  PURPOSE: 定位数组元素的函数示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_7

	implicit none

	! 变量定义
   integer(4)  i, j
   integer(4)  a(3,4), b(-1:2)

   data a /2, 3, -1, 0, 1, -4, -3, -2, 7, 2, 6, 5/

!--- 找出数组中最大元素的位置 maxloc(array[,dim][,mask]) ---
   do i = 1, 3
      print *, (a(i,j), j = 1, 4)
   enddo

   print *
   print *, 'maxloc a:'
   print *, maxloc(a)
   print *, maxloc(a, mask = a .lt. 4) ! 可以附加条件
   print *, maxloc(a, dim = 1)         ! 可以指定维数
   print *, maxloc(a, dim = 2)

   ! 返回的位置是相对的数组下标值
   b = (/1, 4, 2, 3/)
   print *, 'b:'
   print *, maxloc(b)

!--- 找出数组中的最大元素 maxval(array, mask[,dim]) ---
   print *, 'maxval a:'
   print *, maxval(a)
   print *, maxval(a, mask = a .lt. 4) ! 可以附加条件
   print *, maxval(a, dim = 1)         ! 可以指定维数
   print *, maxval(a, dim = 2)

	end program exam_7_7

