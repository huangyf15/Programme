#ifndef EXP04_LINE_H_
#define EXP04_LINE_H_

#include "Point.h"

class Line {
 public:
  Line(Point xp1, Point xp2);
  Line(Line &l);
  
  double getLen() const { return len; }
  
  void showLine();
 
 private:
  Point p1, p2;
  double len;
};

#endif