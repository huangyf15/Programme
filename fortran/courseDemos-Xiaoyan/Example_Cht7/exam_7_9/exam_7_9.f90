!****************************************************************************
!
!  PROGRAM: exam_7_9
!
!  PURPOSE: ��������ĺ���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March 21, 2006
!  MODIFIED: April  3, 2007
!            April 10, 2007
!****************************************************************************

	program exam_7_9

	implicit none

	! ��������
   integer(4)  i, j
   integer(4)  a(2,2), b(2,2), d(2,2), e(3,2)
   real(4)     c
   logical(1)  msk(2,2)

!--- ����Ԫ����ѡ��һ����������C���Ե�������ֵ��� exp1? exp2:exp3��
!    merge(tsource,fsource,mask) ---
   c = -1.0
   print *, merge(' <0', '>=0', c .lt. 0.0) 

   ! ��һѡ������Ԫ�ض�
   a = 1
   b = 0
   data msk /.true., .false., .false., .true./
   d = merge(a, b, msk)
   do i = 1, 2
      print *, (d(i,j), j = 1, 2)
   enddo

!--- ѡ������������Ԫ�����һά���� pack(array,mask[,vector]) ---
   print *
   print *, pack(d, mask = d .ne. 0)
   
   ! �����vector������Ľ�������Ĵ�С��vector��ͬ
   ! ���mask��ȫΪ.TRUE.��������Ľ�������е�Ԫ����vector�ж�Ӧλ�õ�Ԫ�ز���
   ! vector�Ĵ�С������Ľ�������Ĵ�С������Ҫ������ֵ�ĸ���
   print *, pack(d, mask = d .ne. 0, vector = (/1, 2, 3, 4/))

!--- ��һά����vector��ѡ������������Ԫ����䵽Ŀ��������
!         unpack(vector,mask,field) ������������λ�ÿ���field�ж�Ӧ��Ԫ����� ---
   print *
   d = unpack((/2, 3/), .not. msk, d)
   do i = 1, 2
      print *, (d(i,j), j = 1, 2)
   enddo

!--- ��array��dimά�Ͽ���ncopies������µ����� spread(array,dim,ncopies) ---
   e = spread(d(1,:), 1, 3)   ! 2, 2

   print *
   do i = 1, ubound(e,1)
      print *, (e(i,j), j = 1, ubound(e,2))
   enddo

	end program exam_7_9

