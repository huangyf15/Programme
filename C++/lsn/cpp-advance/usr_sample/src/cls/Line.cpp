//"Line.cpp"
#include "Line.h"
#include "Point.h"
#include <iostream>
#include <cmath>
using namespace std;

Line::Line(Point xp1, Point xp2): p1(xp1), p2(xp2) {
  double x = static_cast<double>(p1.getX() - p2.getX());
  double y = static_cast<double>(p1.getY() - p2.getY());
  len = sqrt(x * x + y * y);
}

Line::Line(){
  p1 = Point();
  p2 = Point();
}

Line::Line(const Line &l): p1(l.p1), p2(l.p2) {
  len = l.len;
}

Line::~Line(){};

