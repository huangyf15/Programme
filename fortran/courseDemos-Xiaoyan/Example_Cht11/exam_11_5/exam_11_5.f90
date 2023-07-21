!****************************************************************************
!
!  PROGRAM: exam_11_5
!
!  PURPOSE: 类型转换可用transfer函数替代等价语句
!  
!  PROGRAMMER: 向志海
!
!  DATE: May 8, 2006
!****************************************************************************

	program exam_11_5

	implicit none

!--- transfer 函数的格式为： result = transfer(source, mold [, size]) ---
!    输出值result和mold的类型一致
!    size表示输出值的个数

!  Visualize the transfer bewtween two data using BITVIEW.EXE under Bin folder of CVF
   ! 将实数解释成整数
   print *, transfer(1.0, 9)
   print *

   ! 将整数解释成实数
   print *, transfer(1065353216, 0.2)
   print *

   ! 输出一个大小为2的实数向量（source中的数据未用完）
   print *, transfer((/1.0, 2.0, 3.0/), 0.0, 2)
   print *

   ! 输出一个大小为4的实数向量（source中的数据不够用，用0补充）
   print *, transfer((/1.0, 2.0, 3.0/), 0.0, 4)
   print *

   ! 解释为复数
   print *, transfer((/1.0, 2.0, 3.0/), (/(0.0, 0.0)/))
   print *

   ! 将字符串解释成整数
   print *, transfer('123', 0)
   print *

   ! 将整数解释成字符串
   print *, transfer(3355185, '000')

	end program exam_11_5

