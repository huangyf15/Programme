!****************************************************************************
!
!  PROGRAM: exam_11_5
!
!  PURPOSE: ����ת������transfer��������ȼ����
!  
!  PROGRAMMER: ��־��
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_5

	implicit none

!--- transfer �����ĸ�ʽΪ�� result = transfer(source, mold [, size]) ---
!    ���ֵresult��mold������һ��
!    size��ʾ���ֵ�ĸ���

!  Visualize the transfer bewtween two data using BITVIEW.EXE under Bin folder of CVF
   ! ��ʵ�����ͳ�����
   print *, transfer(1.0, 9)
   print *

   ! ���������ͳ�ʵ��
   print *, transfer(1065353216, 0.2)
   print *

   ! ���һ����СΪ2��ʵ��������source�е�����δ���꣩
   print *, transfer((/1.0, 2.0, 3.0/), 0.0, 2)
   print *

   ! ���һ����СΪ4��ʵ��������source�е����ݲ����ã���0���䣩
   print *, transfer((/1.0, 2.0, 3.0/), 0.0, 4)
   print *

   ! ����Ϊ����
   print *, transfer((/1.0, 2.0, 3.0/), (/(0.0, 0.0)/))
   print *

   ! ���ַ������ͳ�����
   print *, transfer('123', 0)
   print *

   ! ���������ͳ��ַ���
   print *, transfer(3355185, '000')

	end program exam_11_5

