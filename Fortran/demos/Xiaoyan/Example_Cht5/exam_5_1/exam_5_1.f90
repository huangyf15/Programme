!****************************************************************************
!
!  PROGRAM: exam_5_1
!
!  PURPOSE: if���ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: March 4, 2006
!  Modified by Xiaoyan Li, on Oct. 29, 2014
!****************************************************************************

	program exam_5_1

	implicit none

	! ��������
	integer  m, s
	real(4)  a
	real(4)  b
	real(4)  c
	real(4)  max

	!��if
	!����һ������
	print *, 'Please input a integer: '
	read *, m

	if (mod(m,2).eq.0) then
		print *, m, 'is a even number!'
	else
		print *, m, 'is a odd number!'
	endif

	print *


	!select case
	!����һ������
	print *, '����ѧ���ĳɼ���'
	read *, s
	select case (s)
	case (90:100)
		print *,'��ѧ���ĳɼ�Ϊ����'
	case (80:89)
		print *,'��ѧ���ĳɼ�Ϊ����'
	case (70:79)
		print *,'��ѧ���ĳɼ�Ϊ����'
	case (60:69)
		print *,'��ѧ���ĳɼ�Ϊ������'
	case (0:59)
		print *,'��ѧ���ĳɼ�Ϊ��������'
	case default
		print *,'��ѧ���ĳɼ�����ȷ��'
	end select

	print *
	
	!Ƕ�׿�if
	! ��������ʵ��
	print *, 'Please input three real numbers:'
	read *, a, b, c

	! ���������Ӵ�С�����������
ab:   if(a .gt. b) then
ac1:     if(a .gt. c) then
bc:         if(b .gt. c) then
               print *, a, b, c
            else
               print *, a, c, b
            endif bc
         else
            print *, c, a, b
         endif ac1
      else ab
cb:      if(c .gt. b) then
            print *, c, b, a
         else
ac2:        if(a .gt. c) then
              print *, b, a, c
            else ac2
               print *, b, c, a
            endif ac2
         endif cb
      endif ab

   ! ���������
	max = a
	if(max .lt. b) max = b
	if(max .lt. c) max = c
	print *, 'max = ', max

	end program exam_5_1

