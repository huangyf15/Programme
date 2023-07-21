#include "Point.h"

#include <iostream>
#include <cmath>

using namespace std;

Point::Point(int xx, int yy) {
  x = xx;
  y = yy;
  count++;
}

Point::Point(const Point &p) {
  x = p.x;
  y = p.y;
  count++;
}

Point::~Point() { count--; }

void Point::setCoordinate(int xx, int yy) {
  x = xx;
  y = yy;
}

void Point::showCoordinate() {
  cout << "The coordinate of this point is (" << x << "," << y << ")" << endl;
}

void Point::showCount() {
  cout << "Object count = " << count << endl;
}

float dist(const Point &a, const Point &b) {
  double x = a.x - b.x;
  double y = a.y - b.y;
  return static_cast<float>(sqrt(x*x + y*y));
}

void showDistance(const Point &a, const Point &b) {
  cout << "Distance between "
   << "(" << a.x << "," << a.y << ") and "
   << "(" << b.x << "," << b.y << ") is "
   << dist(a,b) << endl;
}

int Point::count = 0;