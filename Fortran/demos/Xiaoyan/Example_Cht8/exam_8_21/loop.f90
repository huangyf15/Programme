!****************************************************************************
!
!  SUBROUTINE: loop
!
!  PURPOSE: ��C���Ի�ϱ��ʾ������C���Ե��ã�
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 17, 2006
!  MODIFIED: Nov.  16, 2010
!****************************************************************************

	subroutine loop(n, a)

	implicit none

	! ��������
   integer(4), intent(in):: n           ! ѭ������
   real(8), intent(out)::   a(n)        ! ��������
   integer(4)  i, j                     ! ѭ������

!--- ����n*(n+1)/2��ѭ�� ---
   do i = 1, n
      do j = i, n
         a(i) = sin(sqrt(dble(i))) * cos(sqrt(dble(j)))
      enddo
   enddo	

	end subroutine loop

