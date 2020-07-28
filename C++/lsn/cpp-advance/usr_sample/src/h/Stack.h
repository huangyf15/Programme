//Stack.h
#ifndef _STACK_H
#define _STACK_H
#include <cassert> 
template <class T, int SIZE = 50>
class Stack {
private:
  T list[SIZE];
  int top;
public:
  Stack();                  // 初始化
  void push(const T &item); // 入栈
  T pop();                  // 出栈
  void clear();             // 清空栈
  const T &peek() const;    // 访问栈顶元素
  bool isEmpty() const;     // 判断栈是否为空
  bool isFull() const;      // 判断栈是否为满
};
#endif  //_STACK_H
