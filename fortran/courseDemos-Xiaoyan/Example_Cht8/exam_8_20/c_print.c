#include <stdio.h>

// ��*.obj�ļ��У���������Ϊ��_c_print
void c_print(int* a, double* b)
{
   printf("In c_print\na = %i, b = %f\n", *a, *b);

   (*a)++;

   (*b)--;

}

// ��*.obj�ļ��У���������Ϊ��_C_print
void C_print(int* a, double* b)
{
   printf("In C_print\na = %i, b = %f\n", *a, *b);

   (*a)--;

   (*b)++;

}
