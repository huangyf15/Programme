!****************************************************************************
!
!  PROGRAM: exam_10_2
!
!  PURPOSE: 文件的访问顺序和存储格式
!  
!  PROGRAMMER: 向志海
!
!  DATE    : May 15, 2006
!  MODIFIED: May 20, 2008
!****************************************************************************

	program exam_10_2

	implicit none

!--- 有格式顺序访问文件 ---
	open(1, file = 'formatted_seq')

   write(1,10) 1
   write(1,10) 2, 'a'

10 format(i2,a1)

!--- 有格式直接访问文件 （这里recl的单位是1个字节）---
	open(2, file = 'formatted_dir', form = 'formatted', access = 'direct',&
           recl=4)

   write(2,10,rec = 2) 20, 'a'    ! 200
   write(2,10,rec = 1) 1
   write(2,20,rec = 2) 20000
20 format(i5)

!--- 无格式顺序访问文件 ---
      ! 受数据表示标准影响, Big endian和Little endian是不同的
      ! 受编译系统影响，PowerStation和Visual Fortran是不同的
	open(3, file = 'unformatted_seq', form = 'unformatted')

   write(3) 1
   write(3) 2, 'a'

!--- 无格式直接访问文件 （这里recl的单位是4个字节）---
      ! 受数据表示标准影响, Big endian和Little endian是不同的
      ! 受编译系统影响，PowerStation和Visual Fortran是不同的
	open(4, file = 'unformatted_dir', form = 'unformatted', access = 'direct', recl=2,&
           status='replace')

   write(4,rec = 2) 2 , 'a'
   !write(4,rec = 1) 1 , 2, 3, 4 ,5

!--- 二进制顺序访问文件 ---
	open(5, file = 'binary_seq', form = 'binary')

   write(5) 1
   write(5) 2, 'a'

!--- 二进制直接访问文件 （这里recl的单位是1个字节）---
	open(6, file = 'binary_dir', form = 'binary', access = 'direct', recl=4,&
           status='replace')

   ! 超过记录长度会覆盖后面记录的内容
   write(6,rec = 2) 2, 'a'    
   write(6,rec = 1) 1, 3

	end program exam_10_2

