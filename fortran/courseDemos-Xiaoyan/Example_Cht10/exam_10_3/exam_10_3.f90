!****************************************************************************
!
!  PROGRAM: exam_10_3
!
!  PURPOSE: 指针作为形参或函数返回值
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 24, 2006
!  MODIFIED: Nov.  27, 2011
!****************************************************************************

	program exam_10_3

	implicit none
   
   interface
      ! 指针作为形参变量时，必须要用接口块声明
      subroutine out(p)
      implicit none
      integer(4), pointer:: p(:,:)
    !  integer(4), intent(in):: p(:,:)          ! 可以用假设形状数组接收
    ! integer(4), intent(in), pointer:: p(:,:) ! 非法
      end

      ! 返回指针变量的函数必须要用接口块声明
      function real2string(number)
      implicit none
      real(4), intent(in)::   number
      character(1), pointer:: real2string(:)
      end
   end interface

	! 变量定义
   integer(4), target::   ary(2,3)
   integer(4), pointer::  ap(:,:)  ! 指向数组的指针（不同于指针数组）
   integer(4)  i  ! 循环变量
   	
!--- 指针作为实参 ---
   ary = reshape((/1:6/), (/2,3/))

   ap => ary
   call out(ap)

   ap => ary(1:2,1:3:2)
   call out(ap)

   ap => ary(1:1,2:2)
   call out(ap)

 ! 指针必须指向相同形状的数组
 !  ap => ary(1,2:2)
 !  call out(ap)

!--- 调用返回指针变量的函数 ---
   ! 注意：这样做在程序运行时会有一部分内存没有得到释放
   !       但是当程序退出后，该部分内存又交还给操作系统
!   do i = 1, 100000
	do i = 1, 10
      print *, real2string(400.31)
   enddo

	end program exam_10_3

!====================================
! 指针变量作为形参
!====================================
   subroutine out(p)
   implicit none
   integer(4), pointer:: p(:,:)
!  integer(4), intent(in):: p(:,:)          ! 可以用假设形状数组接收
!  integer(4), intent(in), pointer:: p(:,:) ! 非法
   integer(4)  i, j  ! 循环变量

!--- 打数组的值 ---
   print *, 'ap = '
   do i = 1, ubound(p,1)
      print *, (p(i,j), j = 1, ubound(p,2))
   enddo
   print *

   end

 !====================================
 ! 将实数转换为字符串
 !====================================
   function real2string(number)
   implicit none
   real(4), intent(in)::   number
   character(1), pointer:: real2string(:)
   character(80)           string       ! 临时字符串变量
   integer(4)              err          ! 分配状态标识
   integer(4)              length       ! 字符串的净长度(去掉末尾的0)
   integer(4)              i            ! 循环变量

!--- 将整数打印成字符串 ---
   write(string,*) number

!--- 计算字符串的净长度 ---
   ! 去掉前面的空格
   string = adjustl(string)

   ! 去掉末尾的0
   length = len_trim(string)
   do while(string(length:length) .eq. '0')
      length = length - 1
   enddo

!--- 分配存储字符串的空间 ---
   allocate(real2string(length), stat = err)
   if(err .ne. 0) stop 'Fail to allocate int2string!'

!--- 将字符串赋给函数返回值 ---
   do i = 1, length
      real2string(i) = string(i:i)
   enddo

 end