!****************************************************************************
!
!  PROGRAM: exam_15_2
!
!  PURPOSE: ����ļ������ٶȵķ�ʽʾ������鿴���¸�������µ��ļ�д��ʱ�䣺
!           1���и�ʽ���޻���
!           2���и�ʽ���л���
!           3���޸�ʽ���޻���
!           4���޸�ʽ���л���
!  
!  PROGRAMMER: ��־��
!
!  DATE:      May 15, 2006
!  MODIFIED: June 10, 2010
!****************************************************************************

	program exam_15_2

	implicit none

   ! ��������
   integer(4)   i       ! ѭ������
   integer(4)   bsize   ! ���̻���Ĵ�С
   character(8) buf     ! �����Ƿ�ʹ���˻���ı�־
   character(7) fm      ! �ļ��Ĵ洢��ʽ
   real(4)      time    ! ��¼����ʱ��

!--- ��һ���л�����ļ� ---
	open(1, file        = 'large',       &
          form        = 'unformatted', &
!           buffered    = 'yes',         & ! ȱʡΪ'no'
!           buffercount = 2,             & ! ȱʡΪ1
!           blocksize   = 8192,          & ! ȱʡΪ8192bytes������Ϊ512bytes��������
           status      = 'scratch')       ! ��ʱ�ļ������������ɾ��

!--- ��ѯ�ļ���״̬ ---
   inquire(1, blocksize = bsize, buffered = buf, formatted = fm)
   
   print *, ' Buffered = ', buf, 'Buffer size = ', bsize, '    Formatted = ', fm

!--- ���ļ���д�����ݣ�����¼ʱ�� ---
   time = secnds(0.0)
   do i = 1, 500000
      write(1) i
 !    write(1,*) i
   enddo

   print *, 'Time elasped: ', secnds(0.0) - time

!--- �ر��ļ����ļ��Ӵ�����ɾ��������status = 'scratch'���Ϳ��Բ������� ---
   close(1, status = 'delete')
	
	end program exam_15_2

