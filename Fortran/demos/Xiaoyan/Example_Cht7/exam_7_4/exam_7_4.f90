!****************************************************************************
!
!  PROGRAM: exam_7_4
!
!  PURPOSE: ����Ĵ�������
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_4

	implicit none

   ! ��������
   integer(4)  i, j
   real(4)     a(2,2), b(2,2), d(2)
   integer(4)  c(5)

!--- ��������������������飨��״������ͬ�� ---
	a = 1.0
   b = 2.0
   a = a + a / b * 3.0 + 0.2
   do i = 1, 2
      print *, (a(i,j), j = 1, 2)
   enddo

!--- ���������������ǲ��д��� ---
   c = [1:5]
   print *, c

   print *
   c(1:5) = c(5:1:-1)
   print *, c

   print *
   c(2:5) = c(1:4)
   print *, c

   print *
   do i = 1, 4
      c(i + 1) = c(i)
   enddo
   print *, c

!--- ������Ϊ�������� ---
   b = sin(a)
   do i = 1, 2
      print *, (b(i,j), j = 1, 2)
   enddo

!--- ������� ---
   d = (/1.0, 2.0/)
   print *, 'd * d = ', dot_product(d, d)

!--- ������� ---
   b = 1.0
   print *, 'b * d = ', matmul(b, d) 

   end program exam_7_4