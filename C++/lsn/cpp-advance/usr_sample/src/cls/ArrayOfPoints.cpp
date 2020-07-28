//ArrayOfPoints.cpp
#include "ArrayOfPoints.h"
#include "Point.h"
#include <iostream>
#include <cassert>
using namespace std;

ArrayOfPoints::ArrayOfPoints(int size): size(size){
  points = new Point[size];
}
ArrayOfPoints::~ArrayOfPoints(){
  delete[] points;
}
ArrayOfPoints::ArrayOfPoints(const ArrayOfPoints& v){
  size = v.size;
  points = new Point[size];
  for (int i = 0; i < size; i++)
    points[i] = v.points[i];
}
Point& ArrayOfPoints::element(int index){
  assert(index >= 0 && index < size);
  return points[index];
}

