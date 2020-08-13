#include "average.h"

#include <iostream>
#include <vector>

using namespace std;

int main() {

  // Vector template
  vector<double> arr(3);
  cout << "Please input three integers successively. \nFirst:" << endl;
  for (auto i = arr.begin(); i != arr.end(); ++i)
    cin >> *i;
  for (auto e : arr)
    cout << e << endl;
  cout << "Average = " << average(arr) << endl;

  return 0;
}