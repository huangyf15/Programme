!****************************************************************************
!
!  PROGRAM: exam_8_9
!
!  PURPOSE: �Զ�������Ϊ�β�
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_9

	implicit none

	! ��������
   integer(4) i

!--- ��������ӡ�Զ������е�Ԫ�� ---
   do i = 1, 2
   	call mul(i,i + 1)
      print *
   enddo

	end program exam_8_9

!====================================
! �Զ�����Ĵ�С����������������ģ�
! ������ڴ�ռ����ӳ�������ʱ��ʱ��
! �䣬�ӳ������ʱ�����ڴ汻�ͷ�
!====================================
   subroutine mul(m, n)
   implicit none
   integer(4), intent(in):: m, n
   integer(4) a(m,n), b(n,m), c(m,m)
   integer(4) i, j

   a = m
   b = n
   c = matmul(a,b)
   c = c * c
   do i = 1, m
      print *, (c(i,j), j = 1, m)
   enddo

   end