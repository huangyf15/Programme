//Stack.cpp
#include "Stack.h"
template <class T, int SIZE>
Stack<T, SIZE>::Stack() : top(-1) { }

template <class T, int SIZE>
void Stack<T, SIZE>::push(const T &item) {
  assert(!isFull());
  list[++top] = item;
}

template <class T, int SIZE>
T Stack<T, SIZE>::pop() {
  assert(!isEmpty());
  return list[top--];
}

template <class T, int SIZE>
const T &Stack<T, SIZE>::peek() const {
  assert(!isEmpty());
  return list[top];   //返回栈顶元素
}

template <class T, int SIZE>
bool Stack<T, SIZE>::isEmpty() const {
  return top == -1;
}

template <class T, int SIZE>
bool Stack<T, SIZE>::isFull() const {
  return top == SIZE - 1;
}

template <class T, int SIZE>
void Stack<T, SIZE>::clear() {
  top = -1;
}
