!****************************************************************************
!
!  PROGRAM: exam_8_7
!
!  PURPOSE: �ַ�������Ϊ�β�
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 4, 2006
!****************************************************************************

	program exam_8_7

	implicit none

   ! ��������������֪������ַ����ͺ����ĳ���
   interface
      function my_trim(char)
      implicit none
      character(*) char
      character(len_trim(adjustl(char))) my_trim
      end
   end interface

	! ��������
   character(20):: banner = 'Programming is fun!'

   ! ���üٶ������ַ�������ʱ��������Ϊһ��ȷ���ĳ���
   character(20)   int2char

!--- ����ַ����� ---
   call prn(banner)

   call prn(banner(13:))

   ! ������ת��Ϊ�ַ���
   print *, int2char(1234)

   ! ȥ����ͷ��ĩβ�Ŀո�
   print *, my_trim('    5678   ')

	end program exam_8_7

!====================================
! �ַ�������Ϊ�β�ʱҪע���䳤��
!====================================
   subroutine prn(banner)
   implicit none
!   character(10) banner
   ! ���賤�ȵ��ַ����β�
   character(*) banner       ! Assumed length character argument

   print *, banner, '        string length = ', len(banner)

   end

!====================================
! ���������Ϳ����Ǽ��賤�ȵ��ַ�����
! ������ʱ��������Ϊһ��ȷ���ĳ��ȣ�
! ��ͬ�ĳ���ģ�������ĳ��ȿ��Բ�ͬ
!====================================
   character(*) function int2char(number)
   implicit none
   integer(4), intent(in):: number

   ! ���ַ�������������ʵ��
   write(int2char,*) number
   
   ! ȥ����ʼ�Ŀո�
   int2char = adjustl(int2char)

   end

!====================================
! ȥ����ͷ��ĩβ�Ŀո�
!====================================
   function my_trim(char)
   implicit none
   character(*) char
   ! ���������ĳ�����ȷ���ģ���������interface��ʽ����
   character(len_trim(adjustl(char))) my_trim

   my_trim = trim(adjustl(char))

   end