#include "NumericSeq.h"

#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

void display(const vector<int> &vec, ostream &os) {
  for (int ix = 0; ix < vec.size(); ++ix)
    os << vec[ix] << ' ';
  os << endl;
}

ostream &operator << (ostream &os, const vector<int> &vec) {
  for (int ix = 0; ix < vec.size(); ++ix)
    os << vec[ix] << ' ';
  return os;
}

void swap(int &val1, int &val2, ofstream *ofil) {
  if (!ofil)
    (*ofil) << "swap(" << val1 << ", " << val2 << ")" << endl;
  int temp = val1;
  val1 = val2;
  val2 = temp;
  if (ofil != nullptr) 
    (*ofil) << "after swap(): val1 " << val1 << "; val2 " << val2 << "\n\n";
}

void bubble_sort(vector<int> &vec, ofstream *ofil) {
  for (int ix = 0; ix < vec.size(); ++ix)
    for (int jx = ix + 1; jx < vec.size(); ++jx)
      if (vec[jx] < vec[ix] ) {
        if (!ofil)
          (*ofil) << "about to call swap!"
                  << " ix: " << ix << " jx: " << jx
                  << "\t swapping: " << vec[ix] << " with " << vec[jx]
                  << endl;
        swap(vec[ix], vec[jx], ofil);
      }
}

int main() {
  int ia[8] = {8, 34, 3, 13, 1, 21, 5, 2};
  vector<int> vec(ia, ia+8);
  ofstream ofil("data.txt");

  cout << "vector before sort: " << vec << endl;
  display(vec, ofil);

  bubble_sort(vec, &ofil);

  cout << "vector after sort: " << vec;
  display(vec, ofil);

  return 0;
}
