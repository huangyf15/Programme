!****************************************************************************
!
!  PROGRAM: exam_10_5
!
!  PURPOSE: 双向动态链表示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 24, 2006
!****************************************************************************

   program exam_10_5

	implicit none

 !--- 派生类型定义 ---
   ! 链表的节点类型
   type node
      real(4)               number           ! 这是节点的内容
      type(node), pointer:: pre  => null()   ! 指向前面节点的指针
      type(node), pointer:: next => null()   ! 指向后面节点的指针
   end type

   ! 链表的表头
   type list
      integer(4)         :: sum  = 0         ! 链表节点总数
      type(node), pointer:: head => null()   ! 指向头节点的指针
      type(node), pointer:: tail => null()   ! 指向尾节点的指针
   end type

!--- 变量定义 ---
   type(list)  queue    ! 链表结构体
   real(4)     r        ! 一个[0,1]上的随机数
   integer(4)  i        ! 被删掉的节点号

!--- Initialize the random seed ---
   call random_seed()

!--- 双向链表的基本操作 ---
   ! 创建一个链表
   call create_list(queue, 10)

   ! 打印链表数据
   print *, 'Original list'
   call print_list(queue)

   ! 随机删掉一个节点
   call random_number(r)
   i = ceiling(r * 10)
   call delete_node(queue, i)

   ! 打印链表数据
   print *, 'After deleting node ', i
   call print_list(queue)

   contains
      !====================================
      ! 产生双向链表
      !====================================
      subroutine create_list(queue, n)
      type(list), intent(out):: queue  ! 产生的链表
      integer(4), intent(in)::  n      ! 链表节点的个数
      integer(4)                i      ! 循环变量
      integer(4)                err    ! 错误标识
      type(node), pointer::     p_node ! 节点指针

      !--- 产生n个节点，并加到链表中 ---
      do i = 1, n
         allocate(p_node, stat = err)
         if(err .eq. 0) then
            call random_number(p_node%number)   ! 随机产生节点值
            
            queue%sum = queue%sum + 1           ! 增加总节点数
           
            ! 将新产生的节点插入到链表中去
            if(associated(queue%head)) then
               ! 当链表不空时
               queue%tail%next => p_node
               p_node%pre      => queue%tail
               queue%tail      => p_node
            else
               ! 空链表
               queue%head => p_node
               queue%tail => p_node
            endif
         else
            print *, 'Node creation error!, i = ', i, ' stat = ', err 
            stop
         end if
      enddo

      end subroutine
      
      !====================================
      ! 从双向链表中删除一个节点
      !====================================
      subroutine delete_node(queue, n)
      type(list), intent(inout):: queue  ! 双向链表
      integer(4), intent(in)::    n      ! 需要删除的链表节点
      integer(4)                  i      ! 循环变量
      integer(4)                  err    ! 错误标识
      type(node), pointer::       p_node ! 节点指针

      !--- 定位至需要删除的链表节点（第n个节点） ---
      i      = 1
      p_node => queue%head
      do while(i .ne. n)
         p_node => p_node%next
         i = i + 1
      end do

      !--- 将第n个节点从链表中删除 ---
      if(.not. associated(p_node%pre)) then  
         ! 删除头节点      
         if(associated(p_node%next)) then
            ! 不是尾节点
            queue%head => p_node%next
            nullify(p_node%next%pre)         ! 下一个节点变成了头节点
         else
            ! 原链表中只有一个节点
            nullify(queue%head)
            nullify(queue%tail)
         endif
      else  ! 不是头节点
         if(associated(p_node%next)) then
            ! 不是尾节点
            p_node%next%pre => p_node%pre
            p_node%pre%next => p_node%next
         else
            nullify(p_node%pre%next)         ! 上一个节点变成了尾节点
            queue%tail => p_node%pre
         endif
      endif
      queue%sum = queue%sum - 1

      !--- 释放被删除节点的内存 ---
      deallocate(p_node, stat = err)
      if(err .ne. 0) stop 'Fail to delete this node!'

      end subroutine

	end program exam_10_5

 !====================================
 ! 打印双向链表中的内容
 !====================================
   subroutine print_list(queue)
   implicit none

 !--- 必须定义派生类型 ---
   type node
      real(4)               number
      type(node), pointer:: pre  => null()
      type(node), pointer:: next => null()
   end type

   type list
      integer(4)         :: sum  = 0
      type(node), pointer:: head => null()
      type(node), pointer:: tail => null()
   end type

!--- 变量定义 ---
   type(list), intent(in):: queue   ! 双向链表
   integer(4)               i       ! 循环变量
   type(node), pointer   :: p_node  ! 节点指针

!--- 打印链表的内容 ---
   print "('There are ', i2, ' nodes in this list.')", queue%sum

   p_node => queue%head
   i      = 0
   do while(associated(p_node))
      i = i + 1
      print *, i, p_node%number
      p_node => p_node%next
   end do

   print *

   end subroutine

