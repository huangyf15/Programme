!****************************************************************************
!
!  PROGRAM: exam_8_17
!
!  PURPOSE: �ӳ�������
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 11, 2006
!****************************************************************************

	program exam_8_17

	implicit none

   ! �����ַ�ʽ���߱����������ӳ�������
   interface list
      subroutine list_int(x)
      implicit none
      integer(4), intent(in):: x
      end

      subroutine list_cplx(x)
      implicit none
      complex(4), intent(in):: x
      end

      subroutine list_int_vec(x)
      implicit none
      integer(4), intent(in):: x(:)
      end

      subroutine list_int_matrix(x)
      implicit none
      integer(4), intent(in):: x(:,:)
      end
   end interface
	
   ! ��������
   integer(4)  x
   complex(4)  c
   integer(4)  v(3)
   integer(4)  m(2,3)

	! ��������ֵ
   x = 1
   c = (2.0, 3.0)
   v = (/3, 2, 4/)
   m = reshape((/1:6/), (/2,3/))

   ! ��һ���ӳ���������ɲ�ͬ�������ݵĴ�ӡ����
   call list(x)

   call list(c)
   
   call list(v)
   
   call list(m)
	
	end program exam_8_17

!====================================
! ��ӡһ������
!====================================
   subroutine list_int(x)
   implicit none
   integer(4), intent(in):: x

   print *, x
   print *

   end

!====================================
! ��ӡһ������
!====================================
   subroutine list_cplx(x)
   implicit none
   complex(4), intent(in):: x

   print "('(', f3.1, ',', f3.1, ')')", real(x), imag(x)
   print *
   
   end

!====================================
! ��ӡһ����������
!====================================
   subroutine list_int_vec(x)
   implicit none
   integer(4), intent(in):: x(:)

   print *, x
   print *

   end

!====================================
! ��ӡһ�����;���
!====================================
   subroutine list_int_matrix(x)
   implicit none
   integer(4), intent(in):: x(:,:)
   integer(4) i, j

   do i = 1, ubound(x,1)
      print *, (x(i,j), j = 1, ubound(x,2))
   enddo

   print *

   end
   
     