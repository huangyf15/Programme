!===================================================
!  PURPOSE: ˵���ⲿ�����г�����Է���һ���������ļ�
!           ���õݹ�ʵ�ֽ׳˲���
!  
!  PROGRAMMER: ��־��
!
!  DATE:     April  3, 2006
!  MODIFIED: April  8, 2008
!            April 14, 2010
!===================================================
recursive integer(4) function factorial(x)  !result(f)
implicit none
integer(4) x

if(x .eq. 1) then
   factorial = 1
   
   !f = 1                      ! ����result���ʱ�������ַ�ʽ
else   
   factorial = x * factorial(x - 1)
   
   !f = x * factorial(x - 1)   ! ����result���ʱ�������ַ�ʽ
end if

! ����ݹ麯���ķ���ֵ�����飬�������result
end function
