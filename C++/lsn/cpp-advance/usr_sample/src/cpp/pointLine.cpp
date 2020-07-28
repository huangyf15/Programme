//pointLine.cpp
#include "Point.h"
#include "Line.h"
#include "ArrayOfPoints.h"
#include <iostream>
#include <cmath>
using namespace std;

int main() {
  int count;
  cout << "Please enter the count of points: ";
  cin >> count;

  ArrayOfPoints pointsArray1(count); //创建对象数组
  pointsArray1.element(0).move(5,10);
  pointsArray1.element(1).move(15,20);

  ArrayOfPoints pointsArray2(pointsArray1); //创建副本
  cout << "Copy of pointsArray1:" << endl;
  cout << "Point_0 of array2: " << pointsArray2.element(0).getX() << ", "
    << pointsArray2.element(0).getY() << endl;
  cout << "Point_1 of array2: " << pointsArray2.element(1).getX() << ", "
    << pointsArray2.element(1).getY() << endl;

  pointsArray1.element(0).move(25, 30);
  pointsArray1.element(1).move(35, 40);
  cout<<"After the moving of pointsArray1:"<<endl;
  cout << "Point_0 of array2: " << pointsArray2.element(0).getX() << ", "
    << pointsArray2.element(0).getY() << endl;
  cout << "Point_1 of array2: " << pointsArray2.element(1).getX() << ", "
    << pointsArray2.element(1).getY() << endl;
  return 0;
}

float dist(const Point &a, const Point &b) { // Point 类的友元函数
  double x = a.x - b.x;
  double y = a.y - b.y;
  return static_cast<float>(sqrt(x*x + y*y));
}

