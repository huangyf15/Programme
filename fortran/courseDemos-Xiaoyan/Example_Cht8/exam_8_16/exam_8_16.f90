!****************************************************************************
!
!  PROGRAM: exam_8_16
!
!  PURPOSE: �ӿڵ�����
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 11, 2006
!  MODIFIED: Nov.  27, 2011
!            April 19, 2013
!****************************************************************************

	program exam_8_16

	implicit none

   ! ������ʽ��֪ͨ������򣬲��ܼ���ӳ���ĵ������
   interface
      subroutine external_list(x, y)
      implicit none
      integer(4), intent(in):: x(:,:)
      real(4), intent(in)::    y(:)
      end
   end interface

	! ��������
   integer(4)  a(2,3)
   real(4)     b(6)

   ! �����鸳��ֵ
   a = reshape([1:6], shape(a))
   b = [1:6]

   ! �ڲ��ӳ�������ʽ�ģ����������Զ������õĺϷ���
   call internal_list(a, b)

   ! �ⲿ�ӳ�������ʽ�ģ�������ʽ˵��������������֪��
   ! �ӳ���Ľӿڣ�Ҳ���޷��Զ������õĺϷ���
   call external_list(a, b)

   contains
   !====================================
   ! ��ӡ����Ԫ��
   !====================================
      subroutine internal_list(x, y)
      implicit none
      integer(4), intent(in):: x(:,:)
      real(4), intent(in)::    y(:)
      integer(4) i, j

      print *, '--- Internal list ---'
      print *, 'x: '
      do i = 1, ubound(x,1)
         print *, (x(i,j), j = 1, ubound(x,2))
      enddo

      print *, 'y: ', y

      end subroutine
	end program exam_8_16
