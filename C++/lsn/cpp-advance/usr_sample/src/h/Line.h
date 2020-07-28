//Line.h
#ifndef _LINE_H
#define _LINE_H

#include "Point.h"

class Line {
public:
  Line();
  Line(Point xp1, Point xp2);
  Line(const Line &l);
  ~Line();
  double getLen() { return len; }
private:
  Point p1, p2;
  double len;
};
#endif//_LINE_H
