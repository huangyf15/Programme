#include <iostream>
#include <cmath>
using namespace std;

class Point {
public:
  Point(int x = 0, int y = 0): x(x), y(y) { // (默认)构造函数
    count++;
  }
  Point(const Point &p) { // 复制构造函数
    x = p.x; y = p.y; count++;
  }
  ~Point() { count--; }   // 析构函数
  int getX() { return x; }
  int getY() { return y; }
  friend float dist(const Point &a, const Point &b); // 友元函数
  static void showCount(){ // 静态成员函数
    cout << "Object count = " << count << endl;
  }
private:
  int x, y;
  static int count;
};

int Point::count = 0;

float dist(const Point &a, const Point &b) {
  double x = a.x - b.x;
  double y = a.y - b.y;
  return static_cast<float>(sqrt(x*x + y*y));
}

class Line {
public:
  Line(Point xp1, Point xp2);
  Line(const Line &l);
  double getLen() { return len; }
private:
  Point p1, p2;
  double len;
};

Line::Line(Point xp1, Point xp2) : p1(xp1), p2(xp2) {
  double x = static_cast<double>(p1.getX() - p2.getX());
  double y = static_cast<double>(p1.getY() - p2.getY());
  len = sqrt(x * x + y * y);
}

Line::Line(const Line &l): p1(l.p1), p2(l.p2) {
  len = l.len;
}

int main() {
  Point myp1(1,1), myp2(4,5);
  cout << "The length of the line is: ";
  cout << dist(myp1,myp2) << endl;
  return 0;
}
