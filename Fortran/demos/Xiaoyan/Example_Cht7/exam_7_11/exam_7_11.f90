!****************************************************************************
!
!  PROGRAM: exam_7_11
!
!  PURPOSE: 起泡排序算法
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March 28, 2006
!  MODIFIED: April 10, 2007
!            April  9, 2010
!****************************************************************************


	program exam_7_11

	implicit none

	! 变量定义
   integer(4)                n         ! 序列的元素个数
   integer(4)                err       ! 内存空间分配状态
   integer(4)                i, j      ! 循环变量
   integer(4)                temp      ! 临时变量，用于交换操作
   integer(4), allocatable:: item(:)   ! 整数序列
   real(4), allocatable::    item_r(:) ! 实数序列

!--- 输入数组大小n，分配数组空间 ---
   print "('请输入数组大小: '\)"
   read *, n

   allocate(item(n), item_r(n), stat = err)
   if(err .ne. 0) stop 'Allocate error'

!--- 随机产生n个1-100之间的整数 ---
   ! 根据运行的时刻产生随机数种子，每一个程序运行时只需要调用一次，不能反复调用
   call random_seed()

   ! 产生n个[0,1)之间的随机实数
   call random_number(item_r)

   ! 将n个[0,1)之间的实数转换成[0,100)之间的整数
   item = int(item_r * 100.0)

   print 10, 0, item

!--- 按从小到大的顺序用起泡算法进行排序 ---
   ! 一共进行n-1趟排序
   do i = n, 2, -1
      ! 每趟排序将大数后移，类似于汽泡上升
      do j = 1, i - 1
         if(item(j) .gt. item(j + 1)) then
            temp        = item(j + 1)
            item(j + 1) = item(j)
            item(j)     = temp
         endif
      enddo

      ! 打印出每一趟排序后的状态
      print 10, n - i + 1, item 
   enddo

10 format(/'第', i0, '趟:', <n>i4)

	end program exam_7_11

