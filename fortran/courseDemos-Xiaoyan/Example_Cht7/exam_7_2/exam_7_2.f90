!****************************************************************************
!
!  PROGRAM: exam_7_2
!
!  PURPOSE: �����������ֵ
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March 20, 2006
!  MODIFIED: April  3, 2007
!            April 10, 2007
!            March 25, 2008
!            April  1, 2010
!****************************************************************************

	program exam_7_2
   
   implicit none

   ! ��������
   real(4):: a(4) = (/1.0, 0.0, -10.0, 3.0/)
   real(4)   b(4), c(2,4), d(2,4), e(3,3)
   integer   i, j
   
!--- ������ֵ��� ---
   ! where���
   where(abs(a) .gt. epsilon(1.0_4)) b = 1.0 / a
   print *, b
   print *

   ! log is an elemental function
   where(a .gt. 0.0) b = log(a)
   print *, b
   print *

   ! sum is not an elemental function
   !where(a .gt. 0.0) b = sum(log(a))

   ! where construction
   where(a .gt. 0.0)
      b = 1.0
   elsewhere
      b = 0.0
   end where

   print *, b
   print *


   ! forall���
   forall(i = 1:4, abs(b(i)) .gt. epsilon(1.0_4)) a(i) = 1.0 / b(i)
   print *, i              ! forall������ָʾ����û������

   forall(i = 1:2, j = 1:4)
      a(i * 0 + j) = 1.0
   !   a(j)   = 1.0           ! forall�����ʹ�����е�ָʾ����
      c(i,j) = b(j) 
      d(i,j) = c(i,j)         ! ��forall��������Ȼ��˳��ִ�У������c�����Ѿ������˸ı�
   end forall

   ! �������Ǿ���ֵ
   forall(i = 1:3, j = 1:3, i .gt. j) e(i,j) = i
   print *
   do i = 1, 3
      print 10, (e(i,j), j = 1, 3)
   enddo 

   ! �������Ǿ����ֵ�ԳƵ������Ǿ�����
   forall(i = 1:3, j = 1:3, i .lt. j) e(i,j) = e(j,i)
   print *
   do i = 1, 3
      print 10, (e(i,j), j = 1, 3)
   enddo

   ! forall��where�����ʹ��
   print *
   print *, 'c:'
   do i = 1, 2
      print 10, (c(i,j), j = 1, 4)
   enddo

   forall(i = 1:2)
      where(abs(c(i,:)) .gt. epsilon(1.0_4)) d(i,:) = 1.0 / c(i,:) + i
   end forall 

   print *
   print *, 'd:'
   do i = 1, 2
      print 10, (d(i,j), j = 1, 4)
   enddo

10 format(4f4.1) 

	end program exam_7_2

