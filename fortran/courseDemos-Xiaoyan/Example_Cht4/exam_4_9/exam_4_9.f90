!****************************************************************************
!
!  PROGRAM: exam_4_9
!
!  PURPOSE: 计算悬臂梁的高阶振形
!           y = chkx - coskx - (shkl - sinkl) / (chkl + coskl) * (shkx - sinkx)
!           可以通过调整计算顺序或增加实数的精度来保证最后结果的精度
!
!  NOTE: 循环、数组和文件还未讲到，这里暂时不要求看懂。只需要注意精度问题  
!  
!  PROGRAMMER: 向志海
!
!  DATE:     March  11, 2008
!****************************************************************************

	program exam_4_9

	implicit none

	! Variables
   integer(4), parameter::  nreal  = selected_real_kind(6)  ! 选取实数的精度
   integer(4), parameter::  n      = 20       ! 取样点总数
   integer(4), parameter::  n_mode = 3        ! 计算的模态数
   real(nreal), parameter:: l      = 10.0     ! 梁的长度
   real(nreal), parameter:: dx     = l / n    ! 取样点的间距
   real(nreal), parameter:: kl(n_mode) = (/1.875, 14.137, 20.420/)   ! 第1、5、7阶模态的k值
   integer(4)  i         ! 循环变量
   integer(4)  j         ! 循环变量
   real(nreal) k         ! kl / l
   real(nreal) a         ! (sinh(kl) -sin(kl)) / (cosh(kl) + cos(kl))
   real(nreal) x         ! 取样点坐标
   real(nreal) y(n + 1)  ! 取样点上的模态值

   ! 打开一个存模态坐标的文件
   open(1, file = 'mode2.dat')

	! 计算第1、5、7阶振形
   do i = 1, n_mode
      x = 0.0
      k = kl(i) / l
      a = (sinh(kl(i)) -sin(kl(i))) / (cosh(kl(i)) + cos(kl(i)))
      do j = 1, n + 1
         !y(j) = cosh(k * x) - cos(k * x) - a * (sinh(k * x) - sin(k * x))
         
         ! 调整顺序以防止大数加小数的情况发生（丢失精度）
         y(j) = (cosh(kl(i)) * cosh(k * x) - sinh(kl(i)) * sinh(k * x)) - &
                (cos(kl(i))  * cos(k * x)  + sin(kl(i))  * sin(k * x))  + &
                (sinh(kl(i)) * sin(k * x)  + sin(kl(i))  * sinh(k * x)) - &
                (cosh(kl(i)) * cos(k * x)  - cos(kl(i))  * cosh(k * x))
                 
         x    = x + dx
      enddo

      ! 归一化
      y = y / sqrt(dot_product(y, y))

      ! 输出模态坐标
      do j = 1, n + 1
         write(1,*) y(j)
      enddo

      write(1,*) 
   enddo
	

	end program exam_4_9

