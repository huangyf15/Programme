#ifndef EXP06_POINTSARRAY_H_
#define EXP06_POINTSARRAY_H_

#include "Point.h"

#include <iostream>
#include <cassert>

using namespace std;

class PointsArray {
 public:
  PointsArray() : PointsArray(1) {};
  PointsArray(int _size);
  PointsArray(const PointsArray &pointsArray);
  PointsArray(PointsArray &&pointsArray);
  ~PointsArray();
  
  Point& element(int index) {
    assert(index >= 0 && index < _size);
    return _points[index];
  }

  int getSize() const { return _size; }
 
 private:
  Point *_points;
  int _size;
};

#endif