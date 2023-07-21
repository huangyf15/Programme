/*****************************************************************************
!
!  PROGRAM: exam_8_21
!
!  PURPOSE: C����ִ���ٶȲ���������Fortran�����г���
!  
!  PROGRAMMER: ��־��
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
  ����Fortran�����г�����һ���ⲿ����
  ע�⣺
  ��1��Fortran����ʱ���ֶ��Զ�ת���ɴ�д��ĸ�����������LOOPҪ��д
  ��2��Fortran��call by reference�����Ժ������β�Ҫ˵����ָ��
  ��3��Fortran�����ǰ�_stdcall��ʽ���е��õģ���*.obj�ļ��У���������Ϊ��_name@n
       n���������β���ռ���ֽ���������c�ĺ����ǰ�_cdecl��ʽ���õģ���*.obj�ļ��У�
       ��������Ϊ��_name�������Ա������˵����������������ʱ�Զ�ջ�Ĳ���������ȷ�ġ�

ע��__cdecl��__stdcall���Ǻ������ù淶(����һ��__fastcall),�涨�˲�������ջ��˳��ͷ���
_cdecl
�����������˳��ѹ������ջ���ɵ����߰Ѳ�������ջ
_stdcall
�����������˳��ѹ������ջ���ɱ������߰Ѳ�������ջ
_fastcall
�ǰѺ��������б��ǰ������������Ĵ���eax,edx,ecx,��������ѹջ
*/
extern void __stdcall LOOP(long* n, double* a);

#define	n  10000 /* ѭ������ */

void main(void)
{
   long		i;             /* ��ʱ���� */
   clock_t  start_time;    /* �ӳ���ʼ����ʱ�����𾭹���ϵͳʱ�ӵ��� */
   clock_t  end_time;      /* �������н���ʱ������ϵͳʱ�ӵ��� */ 
   double	a[n];          /* �������� */
	double	sum = 0.0;     /* ������ͽ�� */
   
/* ��ô�ʱ��ϵͳʱ�ӵ��� */
	start_time = clock();

/* ����Fortran�������n*(n+1)/2��ѭ�� */   
   i = n;         /* ����ȡ����n�ĵ�ַ��������һ����ʱ����i����һ�� */
   LOOP(&i, a);
   
/* ��ô�ʱ��ϵͳʱ�ӵ��� */
	end_time = clock();

/* ��ӡ�������н�� */
	for(i = 0; i < n; i++) sum += a[i];

	printf("Result: %.12f\n", sum);

/* ��ӡ��������ʱ�� */
	printf("Elapsed Time (CLK): %i (%.2f s)\n", end_time - start_time,
                                               (double) (end_time - start_time) / CLOCKS_PER_SEC);
}
