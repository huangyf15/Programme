!****************************************************************************
!
!  PROGRAM: exam_10_2
!
!  PURPOSE: �ļ��ķ���˳��ʹ洢��ʽ
!  
!  PROGRAMMER: ��־��
!
!  DATE    : May 15, 2006
!  MODIFIED: May 20, 2008
!****************************************************************************

	program exam_10_2

	implicit none

!--- �и�ʽ˳������ļ� ---
	open(1, file = 'formatted_seq')

   write(1,10) 1
   write(1,10) 2, 'a'

10 format(i2,a1)

!--- �и�ʽֱ�ӷ����ļ� ������recl�ĵ�λ��1���ֽڣ�---
	open(2, file = 'formatted_dir', form = 'formatted', access = 'direct',&
           recl=4)

   write(2,10,rec = 2) 20, 'a'    ! 200
   write(2,10,rec = 1) 1
   write(2,20,rec = 2) 20000
20 format(i5)

!--- �޸�ʽ˳������ļ� ---
      ! �����ݱ�ʾ��׼Ӱ��, Big endian��Little endian�ǲ�ͬ��
      ! �ܱ���ϵͳӰ�죬PowerStation��Visual Fortran�ǲ�ͬ��
	open(3, file = 'unformatted_seq', form = 'unformatted')

   write(3) 1
   write(3) 2, 'a'

!--- �޸�ʽֱ�ӷ����ļ� ������recl�ĵ�λ��4���ֽڣ�---
      ! �����ݱ�ʾ��׼Ӱ��, Big endian��Little endian�ǲ�ͬ��
      ! �ܱ���ϵͳӰ�죬PowerStation��Visual Fortran�ǲ�ͬ��
	open(4, file = 'unformatted_dir', form = 'unformatted', access = 'direct', recl=2,&
           status='replace')

   write(4,rec = 2) 2 , 'a'
   !write(4,rec = 1) 1 , 2, 3, 4 ,5

!--- ������˳������ļ� ---
	open(5, file = 'binary_seq', form = 'binary')

   write(5) 1
   write(5) 2, 'a'

!--- ������ֱ�ӷ����ļ� ������recl�ĵ�λ��1���ֽڣ�---
	open(6, file = 'binary_dir', form = 'binary', access = 'direct', recl=4,&
           status='replace')

   ! ������¼���ȻḲ�Ǻ����¼������
   write(6,rec = 2) 2, 'a'    
   write(6,rec = 1) 1, 3

	end program exam_10_2

