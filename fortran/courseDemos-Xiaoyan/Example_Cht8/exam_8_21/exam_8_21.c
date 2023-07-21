/*****************************************************************************
!
!  PROGRAM: exam_8_21
!
!  PURPOSE: C语言执行速度测评（调用Fortran子例行程序）
!  
!  PROGRAMMER: 向志海
!
!  DATE:     April 17, 2006
!  MODIFIED: May    9, 2010
!            Nov.  16, 2010
!            Nov.  25, 2010
!****************************************************************************/
#include <stdio.h>
#include <math.h>
#include <time.h>

/*
  声明Fortran子例行程序是一个外部函数
  注意：
  （1）Fortran编译时名字都自动转换成大写字母，所以这里的LOOP要大写
  （2）Fortran是call by reference，所以函数的形参要说明成指针
  （3）Fortran函数是按_stdcall方式进行调用的（在*.obj文件中，函数名称为：_name@n
       n代表所有形参所占的字节总数），c的函数是按_cdecl方式调用的（在*.obj文件中，
       函数名称为：_name）。所以必须加以说明，这样函数调用时对堆栈的操作才是正确的。

注：__cdecl和__stdcall都是函数调用规范(还有一个__fastcall),规定了参数出入栈的顺序和方法
_cdecl
按从右至左的顺序压参数入栈，由调用者把参数弹出栈
_stdcall
按从右至左的顺序压参数入栈，由被调用者把参数弹出栈
_fastcall
是把函数参数列表的前三个参数放入寄存器eax,edx,ecx,其他参数压栈
*/
extern void __stdcall LOOP(long* n, double* a);

#define	n  10000 /* 循环次数 */

void main(void)
{
   long		i;             /* 临时变量 */
   clock_t  start_time;    /* 从程序开始运行时刻算起经过的系统时钟点数 */
   clock_t  end_time;      /* 程序运行结束时经过的系统时钟点数 */ 
   double	a[n];          /* 工作数组 */
	double	sum = 0.0;     /* 数组求和结果 */
   
/* 获得此时的系统时钟点数 */
	start_time = clock();

/* 调用Fortran程序进行n*(n+1)/2次循环 */   
   i = n;         /* 不能取常数n的地址，所以用一个临时变量i代替一下 */
   LOOP(&i, a);
   
/* 获得此时的系统时钟点数 */
	end_time = clock();

/* 打印程序运行结果 */
	for(i = 0; i < n; i++) sum += a[i];

	printf("Result: %.12f\n", sum);

/* 打印程序运行时间 */
	printf("Elapsed Time (CLK): %i (%.2f s)\n", end_time - start_time,
                                               (double) (end_time - start_time) / CLOCKS_PER_SEC);
}
