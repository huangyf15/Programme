!****************************************************************************
!
!  PROGRAM: exam_4_5
!
!  PURPOSE: �������ʽ�͸�ֵ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 1, 2006
!  MODIFIED: March 11, 2009
!  MODIFIED: March 19, 2014 by Xiaoyan Li
!****************************************************************************

   program exam_4_5

   implicit none

   ! ��������
   integer::    i = 3
   integer::    j = 2
   complex(4):: a = (1.5, 2.5)   ! ������������ֵ
   complex(4)   b
   complex(4)   c
   real(4)      length

   ! ����ת��
   print *, i / j, real(i) / j, dble(j) / i, int(real(i) / j), nint(real(i) / j),&
           
            ceiling(real(i) / j)

   print *

	! �������ʽ
   b = (4.5, 5.5)
	c = a + 0.618 * (b - a)

   print *, 'c      = ', c
   print *, 'Re(c)  = ', real(c)
   print *, 'Im(c)  = ', imag(c)
   print *, 'CG(c)  = ', conjg(c)
   print *, 'Arg(c)  = ', atan2(imag(c), real(c))

   length = abs(a - b)
   print *, 'length = ', length
   print *

   end program exam_4_5