#include "Employee.h"
#include "Point.h"
#include "PointsArray.h"
#include "Animal.h"
#include "subclass/Vehicle.h"
#include "subclass/Motorcycle.h"
#include "compute.h"
#include "average.h"

#include <iostream>
#include <vector>

using namespace std;

PointsArray getPoints() {
  PointsArray points(2);
  return points;
}

int main() {
/*
  int a = 1, b = 2, res;
  res = compute(a, b, & max);
  cout << "Max of " << a << " and " << b << " is " << res << endl;

  vector<double> arr(3);
  for (auto i = arr.begin(); i != arr.end(); ++i)
    cin >> *i;
  for (auto e : arr)
    cout << e << endl;
  cout << "Average = " << average(arr) << endl;

  PointsArray points1;
  PointsArray points2(points1);
// TODO: Why is the move constructor not output?
  cout << getPoints().getSize() << endl;

  Dog d;
  d.SetAge(2);
*/

  Motorcycle m;
  m.height = 1.0;
  m.seatNum = 2;
  m.weight = 100.0;
  m.maxSpeed = 60.0;

  m.run();
  m.stop();
  
  return 0;
}