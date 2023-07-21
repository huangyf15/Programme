!****************************************************************************
!
!  PROGRAM: exam_7_6
!
!  PURPOSE: 操作数组的函数示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:      March 21, 2006
!  MODIFIED:  April  1, 2008
!****************************************************************************

	program exam_7_6

	implicit none

	! 变量定义
   integer(4)  i, j
   integer(4)  a(2,3), b(6), c(2,2), d(3,2)

!--- 改变数组形状 reshape(source, shape [, pad] [, order]) ---
   ! 二维数组赋值（缺省按列存储）
   b = (/1:6/)
	a = reshape(b, (/2,3/))
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

   ! 二维数组赋值（按行存储）
	a = reshape(b, shape(a), order=(/2,1/)) ! shape(source)
   print *
   do i = 1, 2
     print *, (a(i,j), j = 1, 3)
   enddo

   ! 不够的位置补0
   data c /1, 2, 3, 4/
   a = reshape(c, shape(a), (/0/))  ! 将c数组看作一维向量 
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo   
	
!--- 数组转置 transpose(matrix) ---
   d = transpose(a)
   print *
   do i = 1, 3
      print *, (d(i,j), j = 1, 2)
   enddo   

!--- 数组元素循环左移 cshift(array,shift[,dim]) ---
   print *
   print *, b
   print *, cshift(b, 2)      ! 循环左移两位
   print *, cshift(b, -2)     ! 循环右移两位

   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo   

   ! 第一行左移一位；第二行右移一位
   a = cshift(a, (/1, -1/), 2)
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo  
       
!--- 数组元素左移，末尾用给定数填充 eoshift(array,shift[,boundary][,dim]) ---
   ! 第一行左移一位，用111填充；第二行右移两位，用222填充
   a = eoshift(a, (/1, -2/), (/111, 222/), 2)
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

   ! 缺省用0填充
   a = eoshift(a, (/1, -2/), dim = 2)
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

	end program exam_7_6

