!****************************************************************************
!
!  PROGRAM: exam_8_2
!
!  PURPOSE: �ⲿ�����г���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 3, 2006
!  MODIFIED: April 8, 2008
!****************************************************************************

!====================================
! �ⲿ�����г�����������Է���������ǰ
!====================================
   subroutine sum_mul(vector, n, sum, mul)
   ! ��������
   implicit none
   integer(4)  n, vector(n)  ! ���������ע�����ּ����С�����������ʽ
   integer(4)  sum, mul      ! �������
   integer(4)  i             ! ��������

!--- ��͡���� ---
   sum = 0
   mul = 1
   do i = 1, n
      sum = sum + vector(i)
      mul = mul * vector(i)
   enddo

   print *, 'sum_mul terminated!'
   print *

   end

!====================================
! ������
!====================================
	program exam_8_2

	implicit none

	! ��������
   integer(4):: a(4) = [1:4], sum, mul

!--- ���������г��� ---
	call sum_mul(a, size(a), sum, mul)
   print *, 'sum = ', sum, ' mul = ', mul
   
   ! û�в���ʱ����ʡ�����ţ�call�Ѿ���������һ�������г���
   call banner

   ! ����һ���ݹ������г���linkʱֻҪ��project�����ҵ���Ӧ��obj�ļ�����
   call factorial(5, mul)
   print *, '5! = ', mul

	end program exam_8_2

!====================================
! �ⲿ�����г�����������Է����������
!====================================
   subroutine banner ! û�в���ʱ����ʡ������

   print *
   print *, 'Programming is fun!'
   print *

   end