/*
#include "Employee.h"
#include "Vehicle.h"
#include "Point.h"
#include "PointsArray.h"
#include "compute.h"
*/
#include "average.h"

#include <iostream>
#include <vector>

using namespace std;

/*
PointsArray getPoints() {
  PointsArr
  ay points(2);
  return points;
}
*/

int main() {

/*
  // Function pointer
  int a = 1, b = 2, res;
  res = compute(a, b, & max);
  cout << "Max of " << a << " and " << b << " is " << res << endl;
*/

  // Vector template
  vector<double> arr(3);
  cout << "Please input three integers successively. \nFirst:" << endl;
  for (auto i = arr.begin(); i != arr.end(); ++i)
    cin >> *i;
  for (auto e : arr)
    cout << e << endl;
  cout << "Average = " << average(arr) << endl;

/*
  // Move constructor
  PointsArray points1;
  PointsArray points2(points1);
// TODO: Why is the move constructor not output?
  cout << getPoints().getSize() << endl;

  // Operator overridding
  Point p(1,2);
  cout << p << endl;
  cout << p++ << endl;
  cout << ++p << endl;
  cout << p-- << endl;
  cout << --p << endl;

  // Virtual function
  Vehicle v;
  Motorcar m;
  Motorcycle mc;
  Vehicle *vp = &v;
  vp->run();
  vp->stop();
  vp = &m;
  vp->run();
  vp->stop();
  vp = &mc;
  vp->run();
  vp->stop();
*/

  return 0;
}