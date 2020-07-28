//lineClassMain.cpp
#include "lineClass.h"
#include <iostream>
#include <cmath>
using namespace std;

//"Point.cpp"
Point::Point(int x, int y): x(x), y(y) { // 构造函数
  count++;
}
Point::Point(): Point(0,0) { // (委托)默认构造函数
  count++;
}
Point::Point(const Point &p) { // 复制构造函数
  x = p.x; y = p.y; count++;
}
Point::~Point() { count--; }   // 析构函数

void Point::showCount(){ // 静态成员函数
  cout << "Object count = " << count << endl;
}

int Point::count = 0;

//"Line.cpp"
Line::Line(Point xp1, Point xp2): p1(xp1), p2(xp2) {
  double x = static_cast<double>(p1.getX() - p2.getX());
  double y = static_cast<double>(p1.getY() - p2.getY());
  len = sqrt(x * x + y * y);
}

Line::Line(){
  p1 = Point::Point();
  p2 = Point::Point();
}

Line::Line(const Line &l): p1(l.p1), p2(l.p2) {
  len = l.len;
}

Line::~Line(){};

//"main.cpp"
int main() {
  Point myp1(1,1), myp2(4,5);
  Point::showCount();
  cout << "The length of the line is: ";
  cout << dist(myp1,myp2) << endl;
  Point::showCount();
  return 0;
}

float dist(const Point &a, const Point &b) {
  double x = a.x - b.x;
  double y = a.y - b.y;
  return static_cast<float>(sqrt(x*x + y*y));
}

