!===================================================
!  PURPOSE: ˵���ⲿ�����г�����Է���һ���������ļ�
!           ���õݹ�ʵ�ֽ׳˲���
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April 3, 2006
!  MODIFIED: April 8, 2008
!===================================================
   recursive subroutine factorial(n, f)
   implicit none
   integer(4), intent(in)::  n   !ע������ı�������
   integer(4), intent(out):: f
 
   integer(4) f1

   if(n .eq. 1) then
      f = 1
   else
      call factorial(n - 1, f1)
      f = n * f1
   end if
   
   end