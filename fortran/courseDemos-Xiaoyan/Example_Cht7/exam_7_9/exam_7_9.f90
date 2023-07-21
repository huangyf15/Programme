!****************************************************************************
!
!  PROGRAM: exam_7_9
!
!  PURPOSE: 构造数组的函数示例
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March 21, 2006
!  MODIFIED: April  3, 2007
!            April 10, 2007
!****************************************************************************

	program exam_7_9

	implicit none

	! 变量定义
   integer(4)  i, j
   integer(4)  a(2,2), b(2,2), d(2,2), e(3,2)
   real(4)     c
   logical(1)  msk(2,2)

!--- 两个元素中选择一个（类似于C语言的条件赋值语句 exp1? exp2:exp3）
!    merge(tsource,fsource,mask) ---
   c = -1.0
   print *, merge(' <0', '>=0', c .lt. 0.0) 

   ! 逐一选择数组元素对
   a = 1
   b = 0
   data msk /.true., .false., .false., .true./
   d = merge(a, b, msk)
   do i = 1, 2
      print *, (d(i,j), j = 1, 2)
   enddo

!--- 选择满足条件的元素组成一维数组 pack(array,mask[,vector]) ---
   print *
   print *, pack(d, mask = d .ne. 0)
   
   ! 如果有vector，输出的结果向量的大小和vector相同
   ! 如果mask不全为.TRUE.，则输出的结果向量中的元素由vector中对应位置的元素补充
   ! vector的大小（输出的结果向量的大小）至少要等于真值的个数
   print *, pack(d, mask = d .ne. 0, vector = (/1, 2, 3, 4/))

!--- 从一维数组vector中选择满足条件的元素填充到目标数组中
!         unpack(vector,mask,field) 不满足条件的位置可向field中对应的元素填充 ---
   print *
   d = unpack((/2, 3/), .not. msk, d)
   do i = 1, 2
      print *, (d(i,j), j = 1, 2)
   enddo

!--- 把array在dim维上拷贝ncopies次组成新的数组 spread(array,dim,ncopies) ---
   e = spread(d(1,:), 1, 3)   ! 2, 2

   print *
   do i = 1, ubound(e,1)
      print *, (e(i,j), j = 1, ubound(e,2))
   enddo

	end program exam_7_9

