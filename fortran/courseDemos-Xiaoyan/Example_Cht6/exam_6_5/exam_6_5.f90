!****************************************************************************
!
!  PROGRAM: exam_6_5
!
!  PURPOSE: 控制编辑符示例 
!  
!  PROGRAMMER: 向志海
!
!  DATE: March 12, 2006
!****************************************************************************

	program exam_6_5

	implicit none
   
	! 变量定义
   integer(4)    a, b
   real(4)       c
   character(10) str

!--- table and space control edit descriptors ---
   ! t: 光标定位
	write(*,10) '--------------------', '+', '+', '+'
10 format(a, t5, a1, t10, a1, t15, a1)
   print *

   ! x:  空格
   ! tl：光标左移
   write(*,20) 246, 12.6, 135
20 format(1x, i3, 5x, f4.1, TL8, i3)
   print *

   ! tr：光标右移
   write(*,30) 12.6, 246, 135
30 format(1x, tr8, f4.1, t2, i3, 1x, i3)
   print *

!--- s, sp, ss ---
   ! sp: 显示+
   ! ss: 不显示+，（缺省）
   ! s : 同ss
   write(*,40) 10, 20, 30, 40
40 format(1x, sp, i3, ss, 1x, i3, sp, 1x, i3, s, 1x, i3)
   print *

!--- bn, bz ---
   ! bn:去掉空格（缺省）
   ! bz:空格解释为0
   read(*,50) a, b        !' 1 2 3 4' 
   write(*,50) a, b
50 format(i4, bz, i4)
   print *

!--- p ---
   ! 输出时乘以10^p （仅适用于实数，而且f格式真正改变输出数据的大小，e格式仅改变显示格式）
   ! p对随后出现的实数都有效，直到出现下一个p
   c = 12.34
   write (*,60) c, c, c, c, c, c, 3
60 format (1x, f9.4, e11.4e2, 1p, f9.4, e11.4e2, -2pf9.4, e11.4e2, 3pi3)
   print *

   ! 表控格式中规定：REAL(4)的格式为 1PG15.7E2 （参考在线帮助"Scale-Factor Editing (P)"）
  print *, 1.2345678, 12.345678, 0.12345678, 0.012345678, 1.175495E-38, 1.175494E-38

!--- : ---
   ! 没有输出项时格式有效
   do a = 1, 3
      write(*,70) (a, b = 1, a)
   enddo
70 format('a1 = ', i1, '  a2 = ', i1, '  a3 = ', i1)
   write(*,*)

   ! 没有输出项时格式无效
   do a = 1, 3
      write(*,80) (a, b = 1, a)
   enddo
80 format('a1 = ', i1 : '  a2 = ', i1 : '  a3 = ', i1)
   print *

!--- / ---   refer to exam_6_4
   !/用于在数据输入输出时结束本行输入输出并开始下一行输入输出
   write (*, 81)  25, 3.46, 6
81 format(i5, f6.3 / 1x, i3)
   print *
   !连续两个//表示跳过一行	
   write (*, 82)  25, 3.46, 6
82 format(i5, f6.3 // 1x, i3)
   print *
!--- \ $ ---
   ! 使光标不换行
   write(*,"('Please input a: '\)")
   read *, a
   write(*,*) 'a = ', a
   print *
   
!--- q ---
   ! 返回输入记录中剩余的字符数给a
   ! q编辑符只能得到字符串的长度
   read(*,90) c, a, (str(b:b), b = 1, a)  ! 输入的字符串不要超过80个字符
90 format( f8.3, q, 80a1)
   
   ! 输出上面的字符串
   write(*,95)   c,      a,     (str(b:b), b = 1, a)
95 format(1x, f8.3, 2x, i2, 2x, <a>a1)


	end program exam_6_5

