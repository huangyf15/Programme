#include "Point.h"

Point::Point(const Point &point){
  _x = point._x;
  _y = point._y;
}

Point::~Point() {}

Point &Point::operator++ () {
  _x++;
  _y++;
  return *this;
}

Point Point::operator++ (int) {
  Point temp = *this;
  ++(*this);
  return temp;
}

Point &Point::operator-- () {
  _x--;
  _y--;
  return *this;
}

Point Point::operator-- (int) {
  Point temp = *this;
  --(*this);
  return temp;
}

ostream & operator << (ostream &o, const Point &p) {
  o << "(" << p._x << "," << p._y << ")";
  return o;
}