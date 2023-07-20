!****************************************************************************
!
!  PROGRAM: exam_7_8
!
!  PURPOSE: �����������Եĺ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 21, 2006
!****************************************************************************

	program exam_7_8

	implicit none

	! ��������
   integer(4)  i, j
   integer(4)  a(2,3), b(2,3)

   data a /1, 2, 3, 4, 5, 6/
   data b /0, 0, 3, 4, 5, 8/

!--- �ж��Ƿ����е�ֵ������ all(mask[,dim]) ---
   print *, 'a:'
   do i = 1, 2
      print *, (a(i,j), j = 1, 3)
   enddo

   print *, 'b:'
   do i = 1, 2
      print *, (b(i,j), j = 1, 3)
   enddo

   print *, 'all a .ne. b:'
   print *, all(a .ne. b)              ! ����Ԫ��һһ�Ƚ�
   print *, all(a .ne. b, dim = 1)     ! ����ѡ��ά��
   print *, all(a .ne. b, dim = 2)

!--- �ж��Ƿ�����ֵ���� any(mask[,dim]) ---
   print *, 'any a .ne. b:'
   print *, any(a .ne. b)              ! ����Ԫ��һһ�Ƚ�
   print *, any(a .ne. b, dim = 1)     ! ����ѡ��ά��
   print *, any(a .ne. b, dim = 2)

!--- ͳ����ֵ�ĸ��� count(mask[,dim]) ---
   print *, 'count a .ne. b:'
   print *, count(a .ne. b)            ! ����Ԫ��һһ�Ƚ�
   print *, count(a .ne. b, dim = 1)   ! ����ѡ��ά��
   print *, count(a .ne. b, dim = 2)

!--- ��������Ԫ�صĳ˻� product(array[,dim][,mask]) ---
   print *, 'product:'
   print *, 'product(a)      : ', product(a)          ! ����Ԫ�صĳ˻�
   print *, 'product(a,dim=1): ', product(a, dim = 1) ! ָ��ά����Ԫ�صĳ˻�
   ! ���Ը�������, û�з���������Ԫ��ʱ���1
   print *, 'product(b,b>0,1): ', product(b, mask = b .gt. 0, dim = 1)

!--- ��������Ԫ�صĺ� sum(array[,dim][,mask]) ---
   print *, 'sum:'
   print *, 'sum(a)      : ', sum(a)                           ! ����Ԫ�صĺ�
   print *, 'sum(a,dim=1): ', sum(a, dim = 1)                  ! ָ��ά����Ԫ�صĺ�
   print *, 'sum(b,a>2,0): ', sum(b, mask = a .gt. 2, dim = 1) ! ���Ը�������

	end program exam_7_8