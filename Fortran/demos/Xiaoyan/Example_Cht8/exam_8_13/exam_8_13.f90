!****************************************************************************
!
!  PROGRAM: exam_8_13
!
!  PURPOSE: 可分配数组作为形参（Fortran95）
!  
!  PROGRAMMER: 向志海
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_13

	implicit none

   ! 形参包括假定形状数组或可分配数组时必须进行显式声明
   interface
      subroutine list(b)
      implicit none
      integer(4), intent(in):: b(:,:)
      end

      subroutine alloc(a)
      implicit none
      integer(4), allocatable, intent(out):: a(:)
      end
   end interface
      
   ! 变量定义
   integer(4), allocatable:: a(:), b(:,:)
   integer(4) err

!--- 可分配数组可以作为实参 ---
   allocate(b(2,3), stat = err)
   if(err .ne. 0) stop 'Failed to allocate array b!'   
   b = 3
   call list(b)

!--- Fortran95中不允许可分配数组作为形参，Fortran2003中允许 ---
   ! 现在数组还没有被分配内存空间
   print *, 'Allocated a? ', allocated(a)
   
   ! 在子程序中给数组分配内存空间
   call alloc(a)

   ! 会返回内存已分配（T），但具体地址没有定义
   print *, 'Allocated a? ', allocated(a)

   ! 这时数组内容是随机的
   print *, 'a = ', a
   
   ! 这样做可能损害其它程序，很危险
   !a = 2
   print *, 'a = ', a

   ! 由于具体地址没有定义，所以会出错
!   deallocate(a)

	end program exam_8_13

!====================================
!  打印假设形状数组中的元素
!====================================
   subroutine list(b)
   implicit none
   integer(4), intent(in):: b(:,:)
  ! integer(4), allocatable:: b(:,:)
   integer(4) i, j

  ! print *, 'Allocated b? ', allocated(b)

   print *, 'b = '
   do i = 1, ubound(b,1)
      print *, (b(i,j), j = 1, ubound(b,2))
   enddo
   print *

!   deallocate(b)

   end   

!====================================
!  给可变数组分配内存空间
!====================================
   subroutine alloc(a)
   implicit none
   integer(4), allocatable, intent(out):: a(:)
   integer(4) err

   allocate(a(5), stat = err)
   if(err .ne. 0) stop 'Failed to allocate array a!'

   a = 1
   print *, 'a = ', a

   ! 子程序返回后，可分配数组的内存空间没有保留

   end      