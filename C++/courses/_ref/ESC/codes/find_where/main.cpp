#include <iostream>
#include <vector>
#include <list>

using namespace std;

template <typename elemType>
void display(const vector<elemType> &vec, ostream &os = cout) {
  typename vector<elemType>::const_iterator iter = vec.begin();
  typename vector<elemType>::const_iterator end_it = vec.end();
  for ( ; iter != end_it; ++iter)
    os << *iter << ' ';
  os << endl;
};

template <typename IteratorType, typename elemType>
IteratorType find(IteratorType first, IteratorType last, const elemType &value) {
  for ( ; first != last; ++first)
    if (value == *first)
      return first;
  return last;
};

int main() {
  const int asize = 8;
  int ia[asize] = {1, 1, 2, 3, 5, 8, 13, 21};
  vector<int> ivec(ia, ia+asize);
  list<int> ilist(ia, ia+asize);

  int *pia = find(ia, ia+asize, 3);
  if (pia != ia+asize)
    cout << "Find objective element in array!\n";
  
  vector<int>::iterator itvec;
  display(ivec);
  itvec = find(ivec.begin(), ivec.end(), 21);
  if (itvec != ivec.end())
    cout << "Find objective element in vector!\n";
  
  list<int>::iterator itlist;
  itlist = find(ilist.begin(), ilist.end(), 55);
  if (itlist != ilist.end())
    cout << "Find objective element in list!\n";

  return 0;
}