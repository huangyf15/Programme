!****************************************************************************
!
!  PROGRAM: exam_8_10
!
!  PURPOSE: �ɵ�������Ϊ�β�
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 10, 2006
!****************************************************************************

	program exam_8_10

	implicit none

	! ��������
   integer(4) a(6), b(6)
   integer(4) i

!--- ��������ӡ�ɵ������е�Ԫ�� ---
   do i = 1, 2
   	call mul(a, b, i, i + 1)
      print *
   enddo	

	end program exam_8_10

!====================================
! �ɵ�����Ĵ�С����������������ģ�
! ������ڴ�ռ����β������������
! �ڴ�ռ䣬�ӳ������ʱ�����ڴ���Ȼ
! ����
!====================================
   subroutine mul(a, b, m, n)
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