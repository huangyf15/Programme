#include <iostream>

using namespace std;

// int extern_int = 0;       // 错误: extern 变量外部可见，所有文件只能定义一次、不能重复定义
extern int extern_int;         // 声明 extern 变量
const int const_int = 0;       // 声明并定义 const 变量
extern const int ex_const_int; // 声明 extern const 变量

void display_extern_int_sub();
void display_const_int_sub();
void display_extern_const_int_sub();

void display_extern_int_main() {
  cout << "extern_int: " << extern_int << endl;
}

void display_const_int_main() {
  cout << "const_int: " << const_int << endl;
}

void display_extern_const_int_main() {
  cout << "extern_const_int: " << ex_const_int << endl;
}

int main() {
  display_extern_int_main(); // extern 为全局作用域，因此输出结果为 2（因此不易弄清变量赋值来源）
  display_const_int_main();  // const 为文件作用域，因此输出结果为 0
  display_extern_const_int_main(); // extern const 为全局作用域，因此输出结果为 1

  display_extern_int_sub(); // extern 为全局作用域，因此输出结果为 2
  display_const_int_sub();  // const 为文件作用域，因此输出结果为 1
  display_extern_const_int_sub();  // extern const 为全局作用域，因此输出结果为 1
  return 0;
}