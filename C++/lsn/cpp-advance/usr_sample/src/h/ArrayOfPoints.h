//ArrayOfPoints.h
#ifndef _ARRAYOFPOINTS_H
#define _ARRAYOFPOINTS_H

#include "Point.h"

class ArrayOfPoints {
public:
  ArrayOfPoints(int size);
  ~ArrayOfPoints();
  Point& element(int index);
  ArrayOfPoints(const ArrayOfPoints& pointsArray);

private:
  Point *points;
  int size;
};
#endif//_ARRAYOFPOINTS_H

