#include <iostream>
#include <vector>
#include <functional>
#include <algorithm>

using namespace std;

template <typename InputIterator, typename OutputIterator,
          typename ElemType, typename Comp>
OutputIterator filter(InputIterator first, InputIterator last, 
                      OutputIterator at, const ElemType &val, Comp pred) {
  while ((first = find_if(first, last, bind2nd(pred, val))) != last) {
    cout << "found value: " << *first << endl;
    *at++ = *first++;
  }
  return at;
};

bool less_than(int i1, int i2) {
  return i1 < i2 ? true : false;
}

bool greater_than(int i1, int i2) {
  return i1 > i2 ? true : false;
}

template <class T>
class not_less : public binary_function<T, T, bool> {
 public:
  bool operator()(const T &l, const T &r) const {
    return l >= r ? true : false;
  }
};

template <class T>
class not_greater {
 public:
  bool operator()(const T &l, const T &r) const {
    return l <= r ? true : false;
  }
};

int main() {
  const int elem_size = 8;
  int ia[elem_size] = {12, 8, 43, 0, 6, 21, 3, 7};
  vector<int> ivec(ia, ia+elem_size);

  int ia2[elem_size];
  vector<int> ivec2;

  cout << "filtering integer array for values less than 8\n";
  filter(ia, ia+elem_size, ia2, elem_size, less<int>());
  
  cout << "filtering integer vector for values greater than 8\n";
  filter(ivec.begin(), ivec.end(), back_inserter(ivec2), elem_size,
         function<bool(int,int)>(greater_than));

  cout << "filtering integer vector for values not less than 8\n";
  filter(ivec.begin(), ivec.end(), back_inserter(ivec2), elem_size, not_less<int>());

  cout << "filtering integer vector for values not greater than 8\n";
  filter(ivec.begin(), ivec.end(), back_inserter(ivec2), elem_size, 
         function<bool(int,int)>(not_greater<int>()));

  return 0;
}