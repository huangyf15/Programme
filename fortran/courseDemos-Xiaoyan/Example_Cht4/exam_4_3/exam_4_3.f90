!****************************************************************************
!
!  PROGRAM: exam_4_3
!
!  PURPOSE: ����ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 1, 2006
!  
!  MODIFIED: March  6, 2007
!            March  4, 2008
!            March 12, 2010
!            June  15, 2010
!****************************************************************************

	program exam_4_3

	implicit none
   character*2 st

   !����(��Ϊ2��36���ƣ�ȱʡΪʮ���ƣ�ֻ��#����ʱΪ16����)
   print *, 1, 2#101, -8#71, #FF, +17#G
   print *

   print *, 128_1, 128_2, 513_1            ! ע�������ı�ʾ��Χ
   print *

   !ʵ�͡�С����ʽ
   print *, 0.233, -3., .2_4, +.2_8 ! ע��С������Чλ��
   print * 


   !ʵ�͡�ָ����ʽ
   print *, 0.2e-3, 0.2d-3, -1e2_4, .3E3_8  !, .3D3_8   ! ָ����ʽ��kindʱ��ֻ����E��������D
   print *

   !����
   print *, (2,#F), (3.,-1.), (5.1e-2, 4.8e3_8)
   print *

	!�ַ��͡���һ���ַ���
   print *, 'Programming', " is fun!"

   !�ַ��͡���H�ַ�������FORTRAN�г��ã�Fortran90�зϳ���
   print *, 19HProgramming is fun!

   !�ַ��͡���C�ַ����������������ķǴ�ӡ�ַ���
	print *, '\a'c, '\A'c, '\a'C

   print *, 'abc\bdef'c

   print *, 'abc\tdef'c

   print *, 'abc\rde'c

   print *, 'abc\\def'c

   print *, 'abc\110def'c

   print *, len('abc\bdef'c)  ! C�ַ�����ĩβ�Զ����NULL�����Գ��Ȼ����NULL

   st = 'c'c         ! �鿴�ڴ棨ʹ�öϵ����+Disassembly��

   print *, st

   print *, char(0)  ! NULL

   print *

   !�߼���
   print *, .true., .false.

	end program exam_4_3

