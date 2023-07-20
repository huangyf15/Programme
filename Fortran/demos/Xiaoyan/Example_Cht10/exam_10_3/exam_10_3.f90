!****************************************************************************
!
!  PROGRAM: exam_10_3
!
!  PURPOSE: ָ����Ϊ�βλ�������ֵ
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 24, 2006
!  MODIFIED: Nov.  27, 2011
!****************************************************************************

	program exam_10_3

	implicit none
   
   interface
      ! ָ����Ϊ�βα���ʱ������Ҫ�ýӿڿ�����
      subroutine out(p)
      implicit none
      integer(4), pointer:: p(:,:)
    !  integer(4), intent(in):: p(:,:)          ! �����ü�����״�������
    ! integer(4), intent(in), pointer:: p(:,:) ! �Ƿ�
      end

      ! ����ָ������ĺ�������Ҫ�ýӿڿ�����
      function real2string(number)
      implicit none
      real(4), intent(in)::   number
      character(1), pointer:: real2string(:)
      end
   end interface

	! ��������
   integer(4), target::   ary(2,3)
   integer(4), pointer::  ap(:,:)  ! ָ�������ָ�루��ͬ��ָ�����飩
   integer(4)  i  ! ѭ������
   	
!--- ָ����Ϊʵ�� ---
   ary = reshape((/1:6/), (/2,3/))

   ap => ary
   call out(ap)

   ap => ary(1:2,1:3:2)
   call out(ap)

   ap => ary(1:1,2:2)
   call out(ap)

 ! ָ�����ָ����ͬ��״������
 !  ap => ary(1,2:2)
 !  call out(ap)

!--- ���÷���ָ������ĺ��� ---
   ! ע�⣺�������ڳ�������ʱ����һ�����ڴ�û�еõ��ͷ�
   !       ���ǵ������˳��󣬸ò����ڴ��ֽ���������ϵͳ
!   do i = 1, 100000
	do i = 1, 10
      print *, real2string(400.31)
   enddo

	end program exam_10_3

!====================================
! ָ�������Ϊ�β�
!====================================
   subroutine out(p)
   implicit none
   integer(4), pointer:: p(:,:)
!  integer(4), intent(in):: p(:,:)          ! �����ü�����״�������
!  integer(4), intent(in), pointer:: p(:,:) ! �Ƿ�
   integer(4)  i, j  ! ѭ������

!--- �������ֵ ---
   print *, 'ap = '
   do i = 1, ubound(p,1)
      print *, (p(i,j), j = 1, ubound(p,2))
   enddo
   print *

   end

 !====================================
 ! ��ʵ��ת��Ϊ�ַ���
 !====================================
   function real2string(number)
   implicit none
   real(4), intent(in)::   number
   character(1), pointer:: real2string(:)
   character(80)           string       ! ��ʱ�ַ�������
   integer(4)              err          ! ����״̬��ʶ
   integer(4)              length       ! �ַ����ľ�����(ȥ��ĩβ��0)
   integer(4)              i            ! ѭ������

!--- ��������ӡ���ַ��� ---
   write(string,*) number

!--- �����ַ����ľ����� ---
   ! ȥ��ǰ��Ŀո�
   string = adjustl(string)

   ! ȥ��ĩβ��0
   length = len_trim(string)
   do while(string(length:length) .eq. '0')
      length = length - 1
   enddo

!--- ����洢�ַ����Ŀռ� ---
   allocate(real2string(length), stat = err)
   if(err .ne. 0) stop 'Fail to allocate int2string!'

!--- ���ַ���������������ֵ ---
   do i = 1, length
      real2string(i) = string(i:i)
   enddo

 end