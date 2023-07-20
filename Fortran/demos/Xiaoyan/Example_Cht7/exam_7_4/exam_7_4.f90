!****************************************************************************
!
!  PROGRAM: exam_7_4
!
!  PURPOSE: 数组的代数运算
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_4

	implicit none

   ! 变量定义
   integer(4)  i, j
   real(4)     a(2,2), b(2,2), d(2)
   integer(4)  c(5)

!--- 数组与标量、数组与数组（形状必须相同） ---
	a = 1.0
   b = 2.0
   a = a + a / b * 3.0 + 0.2
   do i = 1, 2
      print *, (a(i,j), j = 1, 2)
   enddo

!--- 数组的整体操作都是并行处理 ---
   c = [1:5]
   print *, c

   print *
   c(1:5) = c(5:1:-1)
   print *, c

   print *
   c(2:5) = c(1:4)
   print *, c

   print *
   do i = 1, 4
      c(i + 1) = c(i)
   enddo
   print *, c

!--- 数组作为函数参数 ---
   b = sin(a)
   do i = 1, 2
      print *, (b(i,j), j = 1, 2)
   enddo

!--- 向量点积 ---
   d = (/1.0, 2.0/)
   print *, 'd * d = ', dot_product(d, d)

!--- 数组相乘 ---
   b = 1.0
   print *, 'b * d = ', matmul(b, d) 

   end program exam_7_4