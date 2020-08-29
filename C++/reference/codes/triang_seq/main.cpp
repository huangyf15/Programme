#include "Triang.h"

#include <iostream>
#include <vector>

using namespace std;

// sum() based on iterator-like integer
int sum_v1(const Triangular &rhs) {
  if (!rhs.length())
    return 0;
  int val, sum = 0;
  rhs.next_reset();
  while (rhs.next(val)) {
    sum += val;
  }
  return sum;
}

// sum() based on Triangular_iterator
int sum_v2(const Triangular &rhs) {
  if (!rhs.length())
    return 0;
  int sum = 0;
  for (auto it = rhs.begin(); it != rhs.end(); ++it) {
    sum += *it;
  }
  return sum;
}

int main() {
  Triangular tri(20, 2);

  cout << "Triangular Series of " << tri.length() << " elements\n";
  for (auto it = tri.begin(); it != tri.end(); ++it) {
    cout << *it << ' ';
  }
  cout << "\n\n";

  cin >> tri;
  cout << "Present Series: " << tri << '\n';
  cout << "Sum of Series: " << sum_v1(tri) << " (should equals to "
                            << sum_v2(tri) << ")\n";

  return 0;
}