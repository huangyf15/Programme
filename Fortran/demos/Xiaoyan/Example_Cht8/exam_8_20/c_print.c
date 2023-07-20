#include <stdio.h>

// 在*.obj文件中，函数名称为：_c_print
void c_print(int* a, double* b)
{
   printf("In c_print\na = %i, b = %f\n", *a, *b);

   (*a)++;

   (*b)--;

}

// 在*.obj文件中，函数名称为：_C_print
void C_print(int* a, double* b)
{
   printf("In C_print\na = %i, b = %f\n", *a, *b);

   (*a)--;

   (*b)++;

}
