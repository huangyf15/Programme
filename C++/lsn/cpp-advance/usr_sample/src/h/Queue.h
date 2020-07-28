//Queue.h
#ifndef _QUEUE_H
#define _QUEUE_H
#include <cassert>
template <class T, int SIZE = 50>
class Queue {
private:
  int front, rear, count; //队头指针、队尾指针、元素个数
  T list[SIZE];           //队列元素数组
public:
  Queue();          //构造函数，初始化队头指针、队尾指针、元素个数
  void insert(const T &item); //新元素入队
  T remove();                 //元素出队
  void clear();               //清空队列
  const T &getFront() const;  //访问队首元素
  //测试队列状态
  int getLength() const; //求队列长度
  bool isEmpty() const;  //判断队列空否
  bool isFull() const;   //判断队列满否
};
#endif  //_QUEUE_H
