#include "Point.h"

#include <iostream>

using namespace std;

Point::Point(const Point &p) {
  x = p.x;
  y = p.y;
}

Point::~Point() {}

void Point::setCoordinate(int xx, int yy) {
  x = xx;
  y = yy;
}

void Point::showCoordinate() {
  cout << "The coordinate of this point is (" << x << "," << y << ")" << endl;
}
