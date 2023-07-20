!****************************************************************************
!
!  PROGRAM: exam_10_5
!
!  PURPOSE: ˫��̬����ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE: April 24, 2006
!****************************************************************************

   program exam_10_5

	implicit none

 !--- �������Ͷ��� ---
   ! ����Ľڵ�����
   type node
      real(4)               number           ! ���ǽڵ������
      type(node), pointer:: pre  => null()   ! ָ��ǰ��ڵ��ָ��
      type(node), pointer:: next => null()   ! ָ�����ڵ��ָ��
   end type

   ! ����ı�ͷ
   type list
      integer(4)         :: sum  = 0         ! ����ڵ�����
      type(node), pointer:: head => null()   ! ָ��ͷ�ڵ��ָ��
      type(node), pointer:: tail => null()   ! ָ��β�ڵ��ָ��
   end type

!--- �������� ---
   type(list)  queue    ! ����ṹ��
   real(4)     r        ! һ��[0,1]�ϵ������
   integer(4)  i        ! ��ɾ���Ľڵ��

!--- Initialize the random seed ---
   call random_seed()

!--- ˫������Ļ������� ---
   ! ����һ������
   call create_list(queue, 10)

   ! ��ӡ��������
   print *, 'Original list'
   call print_list(queue)

   ! ���ɾ��һ���ڵ�
   call random_number(r)
   i = ceiling(r * 10)
   call delete_node(queue, i)

   ! ��ӡ��������
   print *, 'After deleting node ', i
   call print_list(queue)

   contains
      !====================================
      ! ����˫������
      !====================================
      subroutine create_list(queue, n)
      type(list), intent(out):: queue  ! ����������
      integer(4), intent(in)::  n      ! ����ڵ�ĸ���
      integer(4)                i      ! ѭ������
      integer(4)                err    ! �����ʶ
      type(node), pointer::     p_node ! �ڵ�ָ��

      !--- ����n���ڵ㣬���ӵ������� ---
      do i = 1, n
         allocate(p_node, stat = err)
         if(err .eq. 0) then
            call random_number(p_node%number)   ! ��������ڵ�ֵ
            
            queue%sum = queue%sum + 1           ! �����ܽڵ���
           
            ! ���²����Ľڵ���뵽������ȥ
            if(associated(queue%head)) then
               ! ��������ʱ
               queue%tail%next => p_node
               p_node%pre      => queue%tail
               queue%tail      => p_node
            else
               ! ������
               queue%head => p_node
               queue%tail => p_node
            endif
         else
            print *, 'Node creation error!, i = ', i, ' stat = ', err 
            stop
         end if
      enddo

      end subroutine
      
      !====================================
      ! ��˫��������ɾ��һ���ڵ�
      !====================================
      subroutine delete_node(queue, n)
      type(list), intent(inout):: queue  ! ˫������
      integer(4), intent(in)::    n      ! ��Ҫɾ��������ڵ�
      integer(4)                  i      ! ѭ������
      integer(4)                  err    ! �����ʶ
      type(node), pointer::       p_node ! �ڵ�ָ��

      !--- ��λ����Ҫɾ��������ڵ㣨��n���ڵ㣩 ---
      i      = 1
      p_node => queue%head
      do while(i .ne. n)
         p_node => p_node%next
         i = i + 1
      end do

      !--- ����n���ڵ��������ɾ�� ---
      if(.not. associated(p_node%pre)) then  
         ! ɾ��ͷ�ڵ�      
         if(associated(p_node%next)) then
            ! ����β�ڵ�
            queue%head => p_node%next
            nullify(p_node%next%pre)         ! ��һ���ڵ�����ͷ�ڵ�
         else
            ! ԭ������ֻ��һ���ڵ�
            nullify(queue%head)
            nullify(queue%tail)
         endif
      else  ! ����ͷ�ڵ�
         if(associated(p_node%next)) then
            ! ����β�ڵ�
            p_node%next%pre => p_node%pre
            p_node%pre%next => p_node%next
         else
            nullify(p_node%pre%next)         ! ��һ���ڵ�����β�ڵ�
            queue%tail => p_node%pre
         endif
      endif
      queue%sum = queue%sum - 1

      !--- �ͷű�ɾ���ڵ���ڴ� ---
      deallocate(p_node, stat = err)
      if(err .ne. 0) stop 'Fail to delete this node!'

      end subroutine

	end program exam_10_5

 !====================================
 ! ��ӡ˫�������е�����
 !====================================
   subroutine print_list(queue)
   implicit none

 !--- ���붨���������� ---
   type node
      real(4)               number
      type(node), pointer:: pre  => null()
      type(node), pointer:: next => null()
   end type

   type list
      integer(4)         :: sum  = 0
      type(node), pointer:: head => null()
      type(node), pointer:: tail => null()
   end type

!--- �������� ---
   type(list), intent(in):: queue   ! ˫������
   integer(4)               i       ! ѭ������
   type(node), pointer   :: p_node  ! �ڵ�ָ��

!--- ��ӡ��������� ---
   print "('There are ', i2, ' nodes in this list.')", queue%sum

   p_node => queue%head
   i      = 0
   do while(associated(p_node))
      i = i + 1
      print *, i, p_node%number
      p_node => p_node%next
   end do

   print *

   end subroutine

