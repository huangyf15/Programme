//Node.h
#ifndef NODE_H
#define NODE_H
template <class T>
class Node {
private:
  Node<T> *next;  //指向后继结点的指针
public:
  T data;         //数据域
  Node (const T &data, Node<T> *next = nullptr); //构造函数
  void insertAfter(Node<T> *p);    //在本结点之后插入一个同类结点p
  Node<T> *deleteAfter();          //删除本结点的后继结点，并返回其地址
  Node<T> *nextNode();             //获取后继结点的地址
  const Node<T> *nextNode() const; //获取后继结点的地址
};
#endif //NODE_H
