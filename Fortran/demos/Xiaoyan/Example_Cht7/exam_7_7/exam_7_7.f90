!****************************************************************************
!
!  PROGRAM: exam_7_7
!
!  PURPOSE: ��λ����Ԫ�صĺ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_7

	implicit none

	! ��������
   integer(4)  i, j
   integer(4)  a(3,4), b(-1:2)

   data a /2, 3, -1, 0, 1, -4, -3, -2, 7, 2, 6, 5/

!--- �ҳ����������Ԫ�ص�λ�� maxloc(array[,dim][,mask]) ---
   do i = 1, 3
      print *, (a(i,j), j = 1, 4)
   enddo

   print *
   print *, 'maxloc a:'
   print *, maxloc(a)
   print *, maxloc(a, mask = a .lt. 4) ! ���Ը�������
   print *, maxloc(a, dim = 1)         ! ����ָ��ά��
   print *, maxloc(a, dim = 2)

   ! ���ص�λ������Ե������±�ֵ
   b = (/1, 4, 2, 3/)
   print *, 'b:'
   print *, maxloc(b)

!--- �ҳ������е����Ԫ�� maxval(array, mask[,dim]) ---
   print *, 'maxval a:'
   print *, maxval(a)
   print *, maxval(a, mask = a .lt. 4) ! ���Ը�������
   print *, maxval(a, dim = 1)         ! ����ָ��ά��
   print *, maxval(a, dim = 2)

	end program exam_7_7

