!****************************************************************************
!
!  PROGRAM: exam_4_6
!
!  PURPOSE: 字符串表达式和赋值语句示例
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 1, 2006
!****************************************************************************

	program exam_4_6

   implicit none
   
   ! 变量定义
   character(20):: a = 'Programming'
   character(10):: b = 'is fun!'

   ! 字符串的连接
   print *, a, b
   print *, a // ' ' // b, len(a // ' ' // b)
   print *, trim(a) // ' ' // b,&
            len(trim(a) // ' ' // b), len_trim(trim(a) // ' ' // b)

   ! 子字符串和其它定位函数
   print *, b(4:6)
   print *, b(index(b,'fun'):index(b,'n',back = .true.))

	end program exam_4_6

