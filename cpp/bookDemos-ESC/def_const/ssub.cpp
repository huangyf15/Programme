// extern_int = 0;           // 警告：建议 extern 变量初始化时附加类型名
int extern_int = 2; // extern 变量具有全局作用域，不同文件的同名变量共享一个地址

// extern const int ex_const_int = 2; // 错误：不能与 const.h (sub.cpp) 中的 extern const 变量重复定义
const int ex_const_int = 2;    // const 变量具有文件作用域，不同文件间的同名变量不可见，每个文件保存同名变量的一个副本
extern const int ex_const_int; // 无效声明