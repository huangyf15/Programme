!****************************************************************************
!
!  PROGRAM: exam_6_5
!
!  PURPOSE: ���Ʊ༭��ʾ�� 
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 12, 2006
!****************************************************************************

	program exam_6_5

	implicit none
   
	! ��������
   integer(4)    a, b
   real(4)       c
   character(10) str

!--- table and space control edit descriptors ---
   ! t: ��궨λ
	write(*,10) '--------------------', '+', '+', '+'
10 format(a, t5, a1, t10, a1, t15, a1)
   print *

   ! x:  �ո�
   ! tl���������
   write(*,20) 246, 12.6, 135
20 format(1x, i3, 5x, f4.1, TL8, i3)
   print *

   ! tr���������
   write(*,30) 12.6, 246, 135
30 format(1x, tr8, f4.1, t2, i3, 1x, i3)
   print *

!--- s, sp, ss ---
   ! sp: ��ʾ+
   ! ss: ����ʾ+����ȱʡ��
   ! s : ͬss
   write(*,40) 10, 20, 30, 40
40 format(1x, sp, i3, ss, 1x, i3, sp, 1x, i3, s, 1x, i3)
   print *

!--- bn, bz ---
   ! bn:ȥ���ո�ȱʡ��
   ! bz:�ո����Ϊ0
   read(*,50) a, b        !' 1 2 3 4' 
   write(*,50) a, b
50 format(i4, bz, i4)
   print *

!--- p ---
   ! ���ʱ����10^p ����������ʵ��������f��ʽ�����ı�������ݵĴ�С��e��ʽ���ı���ʾ��ʽ��
   ! p�������ֵ�ʵ������Ч��ֱ��������һ��p
   c = 12.34
   write (*,60) c, c, c, c, c, c, 3
60 format (1x, f9.4, e11.4e2, 1p, f9.4, e11.4e2, -2pf9.4, e11.4e2, 3pi3)
   print *

   ! ��ظ�ʽ�й涨��REAL(4)�ĸ�ʽΪ 1PG15.7E2 ���ο����߰���"Scale-Factor Editing (P)"��
  print *, 1.2345678, 12.345678, 0.12345678, 0.012345678, 1.175495E-38, 1.175494E-38

!--- : ---
   ! û�������ʱ��ʽ��Ч
   do a = 1, 3
      write(*,70) (a, b = 1, a)
   enddo
70 format('a1 = ', i1, '  a2 = ', i1, '  a3 = ', i1)
   write(*,*)

   ! û�������ʱ��ʽ��Ч
   do a = 1, 3
      write(*,80) (a, b = 1, a)
   enddo
80 format('a1 = ', i1 : '  a2 = ', i1 : '  a3 = ', i1)
   print *

!--- / ---   refer to exam_6_4
   !/�����������������ʱ�������������������ʼ��һ���������
   write (*, 81)  25, 3.46, 6
81 format(i5, f6.3 / 1x, i3)
   print *
   !��������//��ʾ����һ��	
   write (*, 82)  25, 3.46, 6
82 format(i5, f6.3 // 1x, i3)
   print *
!--- \ $ ---
   ! ʹ��겻����
   write(*,"('Please input a: '\)")
   read *, a
   write(*,*) 'a = ', a
   print *
   
!--- q ---
   ! ���������¼��ʣ����ַ�����a
   ! q�༭��ֻ�ܵõ��ַ����ĳ���
   read(*,90) c, a, (str(b:b), b = 1, a)  ! ������ַ�����Ҫ����80���ַ�
90 format( f8.3, q, 80a1)
   
   ! ���������ַ���
   write(*,95)   c,      a,     (str(b:b), b = 1, a)
95 format(1x, f8.3, 2x, i2, 2x, <a>a1)


	end program exam_6_5

