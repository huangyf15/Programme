!****************************************************************************
!
!  PROGRAM: exam_7_8
!
!  PURPOSE: 归纳数组属性的函数示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_8

	implicit none

	! 变量定义
   integer(4)  i, j
   integer(4)  a(2,3), b(2,3)

   data a /1, 2, 3, 4, 5, 6/
   data b /0, 0, 3, 4, 5, 8/

!--- 判断是否所有的值都是真 all(mask[,dim]) ---
   print *, 'a:'
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

   print *, 'b:'
   do i = 1, 2
      print *, (b(i,j), j = 1, 3)
   enddo

   print *, 'all a .ne. b:'
   print *, all(a .ne. b)              ! 所有元素一一比较
   print *, all(a .ne. b, dim = 1)     ! 可以选择维数
   print *, all(a .ne. b, dim = 2)

!--- 判断是否任意值是真 any(mask[,dim]) ---
   print *, 'any a .ne. b:'
   print *, any(a .ne. b)              ! 所有元素一一比较
   print *, any(a .ne. b, dim = 1)     ! 可以选择维数
   print *, any(a .ne. b, dim = 2)

!--- 统计真值的个数 count(mask[,dim]) ---
   print *, 'count a .ne. b:'
   print *, count(a .ne. b)            ! 所有元素一一比较
   print *, count(a .ne. b, dim = 1)   ! 可以选择维数
   print *, count(a .ne. b, dim = 2)

!--- 所有数组元素的乘积 product(array[,dim][,mask]) ---
   print *, 'product:'
   print *, 'product(a)      : ', product(a)          ! 所有元素的乘积
   print *, 'product(a,dim=1): ', product(a, dim = 1) ! 指定维数的元素的乘积
   ! 可以附加条件, 没有符合条件的元素时输出1
   print *, 'product(b,b>0,1): ', product(b, mask = b .gt. 0, dim = 1)

!--- 所有数组元素的和 sum(array[,dim][,mask]) ---
   print *, 'sum:'
   print *, 'sum(a)      : ', sum(a)                           ! 所有元素的和
   print *, 'sum(a,dim=1): ', sum(a, dim = 1)                  ! 指定维数的元素的和
   print *, 'sum(b,a>2,0): ', sum(b, mask = a .gt. 2, dim = 1) ! 可以附加条件

	end program exam_7_8