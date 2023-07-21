!****************************************************************************
!
!  PROGRAM: exam_11_7
!
!  PURPOSE: ��������ѧ��ʹ��ʾ��
!  
!  PROGRAMMER: ��־��
!
!  DATE:     May  8, 2006
!  MODIFIED: May 29, 2007
!****************************************************************************

	program exam_11_7

!--- ��ģ�����ʹ��imsl��ѧ�� ---
   use imslf90

	implicit none

!--- �������� ---
   integer, parameter :: n = 3
   real(kind(1.e0)) A(n,n), b(n,1), x(n,1), res(n,1), y(n**2)
   integer i, j


!--- ʹ�� LIN_SOL_GEN �����Դ��������� ---
   ! �������ϵ������.
   call rand_gen(y)
   A = reshape(y,(/n,n/))

   ! Generate random right-hand sides.
   call rand_gen(y)
   b = reshape(y,(/n,1/))

   ! Compute the solution matrix of Ax=b.
   call lin_sol_gen(A, b, x)

   ! Check the results for small residuals.
   res = b - matmul(A, x)
   do i = 1, n
      if(i .eq. n / 2 + 1) then
         print 10, (A(i, j), j = 1, n), x(i, 1), b(i, 1), res(i, 1)
      else
         print 20, (A(i, j), j = 1, n), x(i, 1), b(i, 1), res(i, 1)
      endif   
   end do
	
10 format('| ', <n>(f5.3, 1x)'| * | ', f7.3, ' | - | ', f7.3, ' | = | ', f7.3, ' |')

20 format('| ', <n>(f5.3, 1x)'|   | ', f7.3, ' |   | ', f7.3, ' |   | ', f7.3, ' |')
	
	end program exam_11_7

