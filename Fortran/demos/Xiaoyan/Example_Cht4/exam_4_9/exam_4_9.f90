!****************************************************************************
!
!  PROGRAM: exam_4_9
!
!  PURPOSE: �����������ĸ߽�����
!           y = chkx - coskx - (shkl - sinkl) / (chkl + coskl) * (shkx - sinkx)
!           ����ͨ����������˳�������ʵ���ľ�������֤������ľ���
!
!  NOTE: ѭ����������ļ���δ������������ʱ��Ҫ�󿴶���ֻ��Ҫע�⾫������  
!  
!  PROGRAMMER: ��־��
!
!  DATE:     March  11, 2008
!****************************************************************************

	program exam_4_9

	implicit none

	! Variables
   integer(4), parameter::  nreal  = selected_real_kind(6)  ! ѡȡʵ���ľ���
   integer(4), parameter::  n      = 20       ! ȡ��������
   integer(4), parameter::  n_mode = 3        ! �����ģ̬��
   real(nreal), parameter:: l      = 10.0     ! ���ĳ���
   real(nreal), parameter:: dx     = l / n    ! ȡ����ļ��
   real(nreal), parameter:: kl(n_mode) = (/1.875, 14.137, 20.420/)   ! ��1��5��7��ģ̬��kֵ
   integer(4)  i         ! ѭ������
   integer(4)  j         ! ѭ������
   real(nreal) k         ! kl / l
   real(nreal) a         ! (sinh(kl) -sin(kl)) / (cosh(kl) + cos(kl))
   real(nreal) x         ! ȡ��������
   real(nreal) y(n + 1)  ! ȡ�����ϵ�ģֵ̬

   ! ��һ����ģ̬������ļ�
   open(1, file = 'mode2.dat')

	! �����1��5��7������
   do i = 1, n_mode
      x = 0.0
      k = kl(i) / l
      a = (sinh(kl(i)) -sin(kl(i))) / (cosh(kl(i)) + cos(kl(i)))
      do j = 1, n + 1
         !y(j) = cosh(k * x) - cos(k * x) - a * (sinh(k * x) - sin(k * x))
         
         ! ����˳���Է�ֹ������С���������������ʧ���ȣ�
         y(j) = (cosh(kl(i)) * cosh(k * x) - sinh(kl(i)) * sinh(k * x)) - &
                (cos(kl(i))  * cos(k * x)  + sin(kl(i))  * sin(k * x))  + &
                (sinh(kl(i)) * sin(k * x)  + sin(kl(i))  * sinh(k * x)) - &
                (cosh(kl(i)) * cos(k * x)  - cos(kl(i))  * cosh(k * x))
                 
         x    = x + dx
      enddo

      ! ��һ��
      y = y / sqrt(dot_product(y, y))

      ! ���ģ̬����
      do j = 1, n + 1
         write(1,*) y(j)
      enddo

      write(1,*) 
   enddo
	

	end program exam_4_9

