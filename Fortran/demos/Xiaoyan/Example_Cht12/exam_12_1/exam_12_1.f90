!****************************************************************************
!
!  PROGRAM: exam_12_1
!
!  PURPOSE: �ļ���������ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE    : May 15, 2006
!  MODIFIED: May 20, 2008
!            June 6, 2009
!            Dec. 6, 2010
!****************************************************************************

	program exam_12_1

	implicit none

	! ��������
   integer(4)    i_var   ! I/O ״̬����
   integer(4)    i       ! ��������
   integer(4)    sum     ! ������
   logical       lexist  ! �ļ��Ƿ���ڱ�־
   logical       lopen   ! �ļ��Ƿ�򿪱�־

!--- �и�ʽ˳������ļ� ---
   ! ���ļ�
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

   ! ���ļ��ж�������
   sum = 0
   do
      read(1, *, end = 20) i
      sum = sum + i
   enddo

   ! ���ļ���д������
20 write(1, *) 'sum = ', sum 

   call prn_1

   backspace(1)         ! ȥ���ļ�������־
   backspace(1)         ! �ļ�ָ�����3����¼
   backspace(1)
   backspace(1)

   ! д���ļ�������
   endfile(1)

   call prn_1

   ! �ر��ļ�
   close(1)

!--- �и�ʽֱ�ӷ����ļ� ---
   ! ��ѯ�ļ��Ƿ����
   inquire(file = 'test_dir.txt', exist = lexist)
   
   ! ��ѯ�ļ��Ƿ��
   inquire(2, opened = lopen)

   ! ���ļ�
   if(lexist .and. .not. lopen) then
	   open(2,                       &
           file   = 'test_dir.txt', &
           err    = 40,             &
           iostat = i_var,          &
           access = 'direct',       &
           form   = 'formatted',    &
           status = 'replace',      &
           action = 'write',        &
           recl   = 16)             ! ÿ����¼�ĳ�����16���ֽ�
	
      if(i_var .eq. 0) print *, '"test_dir.txt" opened!'

      ! ���ļ���д������
      do i = 1, 5
   !     write(2, *, rec = i) i ! ֱ�ӷ����ļ��������Ǳ�ظ�ʽ
         write(2, 50, rec = i) i
      enddo

50    format(i2)

      ! �ر��ļ�
      close(2)
   endif

!--- �ļ��򿪴����� ---
   stop 'Program successfully terminated!'

10 stop 'Failed to open file "test_seq.txt"!'

40 stop 'Failed to open file "test_dir.txt"!'

	end program exam_12_1

 !====================================
 ! ��ʾ�ļ�1�е�����
 !====================================
   subroutine prn_1
   implicit none
   character(72) string  ! ���ļ��ж�����ַ���

   ! ���ļ�ָ���ƻ��ļ���ͷ
   rewind(1)   

   ! ��ʾ�ļ�������
   do
      read(1, '(a72)', end = 10) string
      print *, string
   enddo

10 continue

   end

