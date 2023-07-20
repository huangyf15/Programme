!****************************************************************************
!
!  PROGRAM: exam_7_6
!
!  PURPOSE: ��������ĺ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:      March 21, 2006
!  MODIFIED:  April  1, 2008
!****************************************************************************

	program exam_7_6

	implicit none

	! ��������
   integer(4)  i, j
   integer(4)  a(2,3), b(6), c(2,2), d(3,2)

!--- �ı�������״ reshape(source, shape [, pad] [, order]) ---
   ! ��ά���鸳ֵ��ȱʡ���д洢��
   b = (/1:6/)
	a = reshape(b, (/2,3/))
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

   ! ��ά���鸳ֵ�����д洢��
	a = reshape(b, shape(a), order=(/2,1/)) ! shape(source)
   print *
   do i = 1, 2
     print *, (a(i,j), j = 1, 3)
   enddo

   ! ������λ�ò�0
   data c /1, 2, 3, 4/
   a = reshape(c, shape(a), (/0/))  ! ��c���鿴��һά���� 
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo   
	
!--- ����ת�� transpose(matrix) ---
   d = transpose(a)
   print *
   do i = 1, 3
      print *, (d(i,j), j = 1, 2)
   enddo   

!--- ����Ԫ��ѭ������ cshift(array,shift[,dim]) ---
   print *
   print *, b
   print *, cshift(b, 2)      ! ѭ��������λ
   print *, cshift(b, -2)     ! ѭ��������λ

   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo   

   ! ��һ������һλ���ڶ�������һλ
   a = cshift(a, (/1, -1/), 2)
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo  
       
!--- ����Ԫ�����ƣ�ĩβ�ø�������� eoshift(array,shift[,boundary][,dim]) ---
   ! ��һ������һλ����111��䣻�ڶ���������λ����222���
   a = eoshift(a, (/1, -2/), (/111, 222/), 2)
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

   ! ȱʡ��0���
   a = eoshift(a, (/1, -2/), dim = 2)
   print *
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

	end program exam_7_6

