!****************************************************************************
!
!  PROGRAM: exam_15_2
!
!  PURPOSE: 提高文件访问速度的方式示例。请查看以下各种情况下的文件写入时间：
!           1）有格式、无缓存
!           2）有格式、有缓存
!           3）无格式、无缓存
!           4）无格式、有缓存
!  
!  PROGRAMMER: 向志海
!
!  DATE:      May 15, 2006
!  MODIFIED: June 10, 2010
!****************************************************************************

	program exam_15_2

	implicit none

   ! 变量定义
   integer(4)   i       ! 循环变量
   integer(4)   bsize   ! 磁盘缓存的大小
   character(8) buf     ! 磁盘是否使用了缓存的标志
   character(7) fm      ! 文件的存储格式
   real(4)      time    ! 记录运行时间

!--- 打开一个有缓存的文件 ---
	open(1, file        = 'large',       &
          form        = 'unformatted', &
!           buffered    = 'yes',         & ! 缺省为'no'
!           buffercount = 2,             & ! 缺省为1
!           blocksize   = 8192,          & ! 缺省为8192bytes，否则为512bytes的整数倍
           status      = 'scratch')       ! 临时文件，程序结束后删掉

!--- 查询文件的状态 ---
   inquire(1, blocksize = bsize, buffered = buf, formatted = fm)
   
   print *, ' Buffered = ', buf, 'Buffer size = ', bsize, '    Formatted = ', fm

!--- 向文件中写入数据，并记录时间 ---
   time = secnds(0.0)
   do i = 1, 500000
      write(1) i
 !    write(1,*) i
   enddo

   print *, 'Time elasped: ', secnds(0.0) - time

!--- 关闭文件后将文件从磁盘上删除（有了status = 'scratch'，就可以不用它） ---
   close(1, status = 'delete')
	
	end program exam_15_2

