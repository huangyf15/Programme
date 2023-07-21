!****************************************************************************
!
!  PROGRAM: exam_8_4
!
!  PURPOSE: 快速排序算法
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March 28, 2006
!  MODIFIED: APRIL 10, 2007
!            April  9, 2010
!****************************************************************************


	program exam_8_4

	implicit none

	! 变量定义
   integer(4)                n         ! 序列的元素个数
   integer(4)                err       ! 内存空间分配状态
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

   print 10, item
10 format(/'原始序列:  ', <n>i4/)

!--- 按从小到大的顺序用快速排序算法进行排序 ---
   call quicksort(item, 1, n)


!================================================================================
   contains

!*** 快速排序的递归过程 ***
   recursive subroutine quicksort(item, s, t)
   implicit none
   integer(4), intent(inout):: item(:)    ! 整数序列，程序结束时已按从小到大的顺序排列完毕
   integer(4), intent(in)::    s, t       ! 分别为整数序列的起始和终了下标
   integer(4)                  k          ! 枢轴的下标

   if(s .lt. t) then
      call quickpass(item, s, t, k)
      
      call quicksort(item, s, k - 1)

      call quicksort(item, k + 1, t)

   endif

   end subroutine

!*** 一趟快速排序 ***
   subroutine quickpass(item, s, t, k)
   implicit none
   integer(4), intent(inout):: item(:)    ! 整数序列，程序结束时已分割完毕
   integer(4), intent(in)::    s, t       ! 分别为整数序列的起始和终了下标
   integer(4), intent(out)::   k          ! 程序结束时为枢轴的下标
   integer(4)  pivot                      ! 枢轴元素
   integer(4)  i, j                       ! 下标变量
   integer(4) temp

!--- 选取枢轴元素 ---

   pivot = item(s)   ! 简单地取第一个元素为枢轴。为避免蜕化还可以选中间大小的元素为枢轴

!--- 把整数序列按枢轴分割成两部分 ---
   i = s
   j = t
   do while(i .lt. j)
      do while(i .lt. j .and. item(j) .ge. pivot)
         j = j - 1
      enddo
      item(i) = item(j)


     do while(i .lt. j .and. item(i) .le. pivot)
         i = i + 1
      enddo
	  item(j) = item(i)
   enddo


   ! 重新安放枢轴的位置
   item(i) = pivot

   k = i

!--- 打印出每一趟排序后的状态 ---
   print 10, pivot, item

10 format('Pivot = ', i2, ':', <n>i4/)	

   end subroutine

	end program exam_8_4