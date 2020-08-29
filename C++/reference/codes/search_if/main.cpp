#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

template <typename elemType>
void display(const vector<elemType> &vec, ostream &os = cout) {
  typename vector<elemType>::const_iterator iter = vec.begin();
  typename vector<elemType>::const_iterator end_it = vec.end();
  for ( ; iter != end_it; ++iter)
    os << *iter << ' ';
  os << endl;
};

bool grow_vec(vector<int> &vec, int elem) {
  while (vec.back() < elem)
    vec.push_back(vec[vec.size()-2]+vec[vec.size()-1]);
  return ((vec.back() == elem) ? true : false);
}

bool is_elem(vector<int> &vec, int elem) {
  int max_value = vec.empty() ? 0 : vec[vec.size() - 1];
  if (max_value < elem)
    return grow_vec(vec, elem);
  if (max_value == elem)
    return true;

  vector<int> temp(vec.size());
  copy(vec.begin(), vec.end(), temp.begin());
  sort(temp.begin(), temp.end());
  return binary_search(temp.begin(), temp.end(), elem);
}

int main() {
  const int asize = 8;
  int ia[asize] = {1, 1, 2, 3, 5, 8, 13, 21};
  vector<int> ivec(ia, ia+asize);
  int inum = 55;

  if (is_elem(ivec, inum))
    cout << inum << " is an element of ivec." << endl;
  else 
    cout << inum << " is not an element of ivec." << endl;
  display(ivec);

  return 0;
}