#include "PointsArray.h"

#include <iostream>

using namespace std;

PointsArray::PointsArray(int size) : _size(size) {
  _points = new Point[_size];
  cout << "Simple constructor!" << endl;
}

PointsArray::PointsArray(const PointsArray &other) {
  _size = other._size;
  _points = new Point[_size];
  for (int i = 0; i < _size; i++)
    _points[i] = other._points[i];
  cout << "Copy constructor!" << endl;
}

PointsArray::PointsArray(PointsArray &&other) {
  _size = other._size;
  _points = new Point[_size];
  for (int i = 0; i < _size; i++) {
    _points[i] = other._points[i];
  }
  other._points = nullptr;
  cout << "Move constructor!" << endl;
}

PointsArray::~PointsArray() {
  delete[] _points;
  cout << "Deleting..." << endl;
}