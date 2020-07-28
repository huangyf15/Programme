//Queue.cpp
#include "Queue.h"
// 构造函数，初始化队头指针、队尾指针、元素个数
template <class T, int SIZE>
Queue<T, SIZE>::Queue() : front(0), rear(0), count(0) { }

// 向队尾插入元素
template <class T, int SIZE>
void Queue<T, SIZE>::insert (const T& item) {
  assert(count != SIZE);
  count++;                  //元素个数增1
  list[rear] = item;        //向队尾插入元素
  rear = (rear + 1) % SIZE; //队尾指针增1，用取余运算实现循环队列
}
template <class T, int SIZE> T Queue<T, SIZE>::remove() {
  assert(count != 0);
  int temp = front;            //记录下原先的队首指针
  count--;                     //元素个数自减
  front = (front + 1) % SIZE;  //队首指针增1。取余以实现循环队列
  return list[temp];           //返回首元素值
}

// 返回队首元素
template <class T, int SIZE>
const T &Queue<T, SIZE>::getFront() const {
  return list[front];
}

// 返回队列元素个数
template <class T, int SIZE>
int Queue<T, SIZE>::getLength() const {
  return count;
}

// 测试队空否
template <class T, int SIZE>
bool Queue<T, SIZE>::isEmpty() const {
  return count == 0;
}
// 测试队满否
template <class T, int SIZE>
bool Queue<T, SIZE>::isFull() const {
  return count == SIZE;
}
// 清空队列
template <class T, int SIZE>
void Queue<T, SIZE>::clear() {
  count = 0;
  front = 0;
  rear = 0;
}
