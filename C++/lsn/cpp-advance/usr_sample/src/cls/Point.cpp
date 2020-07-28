//Point.cpp
#include "Point.h"
#include <iostream>
using namespace std;

//"Point.cpp"
Point::Point(int x, int y): x(x), y(y) { // 构造函数
  cout << "Constructor called." << endl;
  count++;
}
Point::Point(): Point(0,0) { // (委托)默认构造函数
  cout << "Default constructor called." << endl;
  count++;
}
Point::Point(const Point &p) { // 复制构造函数
  cout << "Copy constructor called." << endl;
  x = p.x; y = p.y; count++;
}
Point::~Point() { // 析构函数
  cout << "Destructor called." << endl;
  count--;
}

void Point::move(int newX, int newY) {
  x = newX;
  y = newY;
}

void Point::showCount(){ // 静态成员函数
  cout << "Object count = " << count << endl;
}

int Point::count = 0;

