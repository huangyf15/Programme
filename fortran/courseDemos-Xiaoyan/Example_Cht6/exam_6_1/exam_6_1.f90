!****************************************************************************
!
!  PROGRAM: exam_6_1
!
!  PURPOSE: ��ظ�ʽ���ڲ���¼ʾ�� 
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March 12, 2006
!  MODIFIED: March 27, 2007
!****************************************************************************

	program exam_6_1

	implicit none

	! ��������
   integer(4)      i
   real(4)         a
   character(80):: in = "1.2, 2"
   character(80)   out



   ! ��ȱʡ�豸�����̣��ж������ݣ�����ȱʡ�豸����Ļ������
   read *, i
   !read(5,*) i
   print *, 'Echo: ', i
   !write(6,*) i
   print *

   ! ���ڲ���¼�а���ظ�ʽ��������
   read(in,*) i, a

   ! ����Ļ�������
   print *, i, a

   ! ���ڲ���¼���������
   write(out,*) i, a

   ! ����Ļ����ڲ���¼
   write(*,*) out

	

	end program exam_6_1

