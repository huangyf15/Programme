!****************************************************************************
!
!  PROGRAM: exam_12_1
!
!  PURPOSE: 文件基本操作示例
!  
!  PROGRAMMER: 向志海
!
!  DATE    : May 15, 2006
!  MODIFIED: May 20, 2008
!            June 6, 2009
!            Dec. 6, 2010
!****************************************************************************

	program exam_12_1

	implicit none

	! 变量定义
   integer(4)    i_var   ! I/O 状态变量
   integer(4)    i       ! 工作变量
   integer(4)    sum     ! 计数器
   logical       lexist  ! 文件是否存在标志
   logical       lopen   ! 文件是否打开标志

!--- 有格式顺序访问文件 ---
   ! 打开文件
	open(1,                         &
        file     = 'test_seq.txt', &
        err      = 10,             &
        iostat   = i_var,          &
        access   = 'sequential',   &
        form     = 'formatted',    &
        status   = 'old',          &
        action   = 'readwrite',    &
        position = 'rewind')

   if(i_var .eq. 0) then
      print *, '"test_seq.txt" opened!'
   else if(i_var .gt. 0) then
      print *, 'File openning error:', i_var
      stop
   else
      print *, 'Reach to the end of file "test_seq.txt"!'
      stop
   end if

   ! 从文件中读入数据
   sum = 0
   do
      read(1, *, end = 20) i
      sum = sum + i
   enddo

   ! 向文件中写入数据
20 write(1, *) 'sum = ', sum 

   call prn_1

   backspace(1)         ! 去掉文件结束标志
   backspace(1)         ! 文件指针回绕3个记录
   backspace(1)
   backspace(1)

   ! 写入文件结束符
   endfile(1)

   call prn_1

   ! 关闭文件
   close(1)

!--- 有格式直接访问文件 ---
   ! 查询文件是否存在
   inquire(file = 'test_dir.txt', exist = lexist)
   
   ! 查询文件是否打开
   inquire(2, opened = lopen)

   ! 打开文件
   if(lexist .and. .not. lopen) then
	   open(2,                       &
           file   = 'test_dir.txt', &
           err    = 40,             &
           iostat = i_var,          &
           access = 'direct',       &
           form   = 'formatted',    &
           status = 'replace',      &
           action = 'write',        &
           recl   = 16)             ! 每个记录的长度是16个字节
	
      if(i_var .eq. 0) print *, '"test_dir.txt" opened!'

      ! 向文件中写入数据
      do i = 1, 5
   !     write(2, *, rec = i) i ! 直接访问文件不可以是表控格式
         write(2, 50, rec = i) i
      enddo

50    format(i2)

      ! 关闭文件
      close(2)
   endif

!--- 文件打开错误处理 ---
   stop 'Program successfully terminated!'

10 stop 'Failed to open file "test_seq.txt"!'

40 stop 'Failed to open file "test_dir.txt"!'

	end program exam_12_1

 !====================================
 ! 显示文件1中的内容
 !====================================
   subroutine prn_1
   implicit none
   character(72) string  ! 从文件中读入的字符串

   ! 将文件指针绕回文件开头
   rewind(1)   

   ! 显示文件的内容
   do
      read(1, '(a72)', end = 10) string
      print *, string
   enddo

10 continue

   end

