#include "average.h"

#include <vector>

using namespace std;

double average(const vector<double> &arr) {
  double sum = 0;
  for (unsigned i = 0; i<arr.size(); i++)
    sum += arr[i];
  return sum / arr.size();
}