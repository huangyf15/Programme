!****************************************************************************
!
!  PROGRAM: exam_4_6
!
!  PURPOSE: �ַ������ʽ�͸�ֵ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 1, 2006
!****************************************************************************

	program exam_4_6

   implicit none
   
   ! ��������
   character(20):: a = 'Programming'
   character(10):: b = 'is fun!'

   ! �ַ���������
   print *, a, b
   print *, a // ' ' // b, len(a // ' ' // b)
   print *, trim(a) // ' ' // b,&
            len(trim(a) // ' ' // b), len_trim(trim(a) // ' ' // b)

   ! ���ַ�����������λ����
   print *, b(4:6)
   print *, b(index(b,'fun'):index(b,'n',back = .true.))

	end program exam_4_6

