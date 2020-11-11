#ifndef CONST_CONST_H_
#define CONST_CONST_H_

// extern int extern_int = 1; // 警告：不建议 extern 变量直接初始化，否则与定义无异
extern int extern_int;     // 建议在头文件中声明 extern 对象（全局作用域、外部可见、可在外部定义），不可重复定义
const int const_int = 1;   // 建议在头文件中定义 const 对象（文件作用域、外部不可见、不可改动[非理想常量]），可以重复定义
extern const int ex_const_int = 1; // 建议在头文件定义 extern const 对象（全局作用域、外部可见、不可改动[理想常量]），不可重复定义

#endif