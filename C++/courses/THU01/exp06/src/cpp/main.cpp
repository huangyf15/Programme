#include "Employee.h"
#include "Point.h"
#include "PointsArray.h"
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
  int a = 1, b = 2, res;
  res = compute(a, b, & max);
  cout << "Max of " << a << " and " << b << " is " << res << endl;

  PointsArray points1;
  PointsArray points2(points1);
// TODO: Why is the move constructor not output?
  cout << getPoints().getSize() << endl;
/*
  Simple constructor!
  2
  Deleting...
*/

  vector<double> arr(3);
  for (auto i = arr.begin(); i != arr.end(); ++i)
    cin >> *i;
  for (auto e : arr)
    cout << e << endl;
  cout << "Average = " << average(arr) << endl;

  return 0;
}