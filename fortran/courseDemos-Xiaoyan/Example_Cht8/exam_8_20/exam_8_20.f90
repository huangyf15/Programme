!****************************************************************************
!
!  PROGRAM: exam_8_20
!
!  PURPOSE: ��C���Ի�ϱ��ʾ��������C���Ժ�����
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 11, 2006
!  MODIFIED: Nov.  25, 2010
!****************************************************************************

	program exam_8_20

	implicit none      

   ! ͨ�����ַ�ʽ���߱������C���Ժ����Ľӿ�
   interface
	   subroutine c_print(a, b)
      ! ��*.obj�ļ��У���������ȫת����Сд��ĸ��������C����һ�����ں�����ǰ��_
	   !DEC$ attributes c :: c_print

      ! �����Ĵ��ݷ�ʽΪ��Call by reference
       !DEC$ attributes reference :: a, b
	   integer(4) a
	   real(8)    b
	   end subroutine c_print

	   subroutine d_print(a, b)
      ! C_print������������д��Сд��ĸ��Ϊ����ʶ������Ҫ��һ������
	   !DEC$ attributes alias:'_C_print' :: d_print

      ! �����Ĵ��ݷ�ʽΪ��Call by reference
      !DEC$ attributes reference :: a, b
	   integer(4) a
	   real(8)    b
	   end subroutine d_print
	end interface

   ! ��������
   integer(4) :: a = 1
	real(8)    :: b = 2.0_8
      
!--- ����C���Ա�д�ĺ��� ---   
   call c_print(a, b)

   ! �������غ�ʵ�ε�ֵҲ�����˸ı�
	print *, "In Fortran"
   print *, "a = ", a, " b = ", b
   print *

   call d_print(a, b)

   ! �������غ�ʵ�ε�ֵҲ�����˸ı�
	print *, "In Fortran"
   print *, "a = ", a, " b = ", b

	end program exam_8_20