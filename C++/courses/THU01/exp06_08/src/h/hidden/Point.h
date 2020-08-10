#ifndef EXP08_POINT_H_
#define EXP08_POINT_H_

#include <iostream>

using namespace std;

class Point {
 public:
  Point(int x = 0, int y = 0) : _x(x), _y(y) {}
  Point(const Point &point);
  ~Point();

  Point &operator++ ();
  Point operator++ (int);
  Point &operator-- ();
  Point operator-- (int);
  friend ostream &operator << (ostream &o, const Point &p);

  int getX() const { return _x; }
  int getY() const { return _y; }
  void move(int newX, int newY) { _x = newX; _y = newY; }
 
 private:
  int _x, _y;
};

#endif