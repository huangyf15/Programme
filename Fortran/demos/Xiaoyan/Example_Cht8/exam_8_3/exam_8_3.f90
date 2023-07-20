!****************************************************************************
!
!  PROGRAM: exam_8_3
!
!  PURPOSE: �ڲ��ӳ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 3, 2006
!****************************************************************************

	program exam_8_3

	implicit none

	! ��������
   real(4):: x = 1.0_4, y = 2.0_4, z = 2.0_4
   real(4)   l
	
!--- ���㳤�� ---
   l = sqrt(x * x + y * y + z * z)

!--- ���������м��㷽���� ---
   print *, 'The direction is (host      ): ', x / l, y / l, z / l
   print *

!--- �����ڲ��ӳ�����㷽���� ---
   print *, 'The direction is (dir       ): ', dir(x), dir(y), dir(z)
   print *

   call output
   
   contains
!====================================
! ���㷽����
!====================================
      real(4) function dir(a)
      implicit none
      real(4) a
      real(4):: l = 2.0

      ! �ڲ��ӳ����ж���ı�����host�ж���ı�������
      dir = a / l

      end function   ! The keyword 'function' is a must.

!====================================
! �����Ѿ�������ڲ��ӳ���ͱ������ڲ��ӳ���
!====================================
      subroutine output
      implicit none

      ! �ڲ��ӳ������ʹ��host�ж���ı���
      ! dir�ж����l�����ﲻ�ɼ�
      print *, 'The direction is (output    ): ', x / l, y / l, z / l
      print *

      ! �ڲ��ӳ�����Ե����ڲ��ӳ��򣬲��ö�������
      print *, 'The direction is (output-dir): ', dir(x), dir(y), dir(z)

      end subroutine ! The keyword 'subroutine' is a must.

   end program exam_8_3

