!****************************************************************************
!
!  PROGRAM: exam_6_3
!
!  PURPOSE: 数据编辑符示例 
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March 12, 2006
!  MODIFIED: March 25, 2009
!            March 26, 2010
!            Nov.   4, 2010
!****************************************************************************

	program exam_6_3

	implicit none
	 
	! 变量定义
   integer(4) j
   integer(4) k
   complex(4) c
   
!--- integer ---
   !  不同域宽的影响
   write(*,10) 123, 123, 123, 123
10 format(       i,  i4,  i2,  i0)
   print *

   !  重复次数和最少位数的作用
   write(*,20) 12, 123, 12
20 format(3i4.3)
   print *

   !  在程序运行的时候重复次数、域宽和最少位数都是可以变化的
   do j = 1, 4
	   write(*, 30) (j, k = 1, j)    ! 隐式循环语句
   enddo
30 format(<j>i<j+1>.<j>)
   print *
   
!--- float ---
   ! 小数形式，不同域宽的影响
   write(*,40) 1.1, 22.2, -33.11, 44.116, -55.115, 66.116, -77.116
40 format(       f, f5.1,   f8.3,   f0.2,    f4.0,   f0.0,    f2.0)
   print *

   ! 指数形式，整数为0
   write(*,50) 1.1,  22.2,  -33.11, -44.116, -55.115, -55.115  
50 format(    e8.1, e11.3, e13.6e1,   e10.3,   e10.4,   e9.4)
   print *

   ! 指数形式，双精度（不能再指定指数的位数了'e'）
   write(*,60) 1.1,  22.2, -33.11, -44.116, -55.115, -55.115  
60 format(    d8.1, d11.3,  d13.6,   d10.3,   d10.4,   d9.4)
   print *

   ! 指数形式，工程计数法（指数都是3的倍数）
   write(*,70) 0.1, -2.2, 3333.3, -44.4
70 format(3(en10.1), en5.1)   
   print *           

   ! 指数形式，科学计数法
   write(*,80) 0.1, -2.2, 3333.3, -44.4
80 format(3es10.1, es5.1)   
   print *           

!--- complex ---
   c = (1.0, 2.0)
   write(*,90) c
90 format(2f5.1)        ! 用两个实数编辑符，没有()
   
   write(*,96) c
95 format('('f0.1,',',f0.1, ')')     ! 自己添加复数格式
96 format(f0.1, ' + ', f0.1, 'i') 
   print *

!--- logical ---
    write(*,100) .true., .false., .true., .false.
100 format(l, l1, l2, l3)
    print *

!--- character ---
    ! 注意不同域宽的影响
    write(*,110) 'fortran', 'fortran', 'fortran'
110 format(a, a8, a5)
    print *

!--- general ---
    ! gw.d[e] 对实数来说d[e]代表显示的有效位数，对其它数据类型d[e]无效
    ! 输出实数时，根据数据的大小来决定是F格式还是E格式（具体请见在线帮助）
    write(*,120) 1, 22.2, -3.33, 1.2, 44.44, .true., 'fortran'
120 format(   g8.3, g8.1, 5g8.3)
    print *
 
!--- binary ---
    write(*, 130) 5, -5_1  ! 按“补码”规则，负数的补码为对应正数按位取反，然后在末尾加1
130 format(b8.8, b9)
    print *

!--- 输出字符的ASCII码 ---
    ! 二进制
    write(*, 140) 'a', '中'
140 format(b8.8, b17.16)
    print *
       
    ! 八进制   
    write(*, 150) 'a', '中'
150 format(o3.3, o7)
    print *

    ! 十六进制
    write(*, 160) 'a', '中'
160 format(z2.2, z5)
    print *

    ! 不能直接得到十进制的ASCII码，应该用函数ICHAR
!    write(*, 170) 'a', '中'
!170 format(i8, i9)

	end program exam_6_3

