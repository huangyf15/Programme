#include "NumSeq.h"

template <typename T>
ostream &operator << (ostream &os, const vector<T> &vec) {
  for (auto elem : vec)
    os << elem << ' ';
  return os;
}

int main() {
  NumSequence ns(1,11);
  const int pos = 7;
  for (int ix = 1; ix < NumSequence::num_of_sequence(); ++ix) {
    ns.set_sequence(NumSequence::ns_type(ix));
    int elem_val = ns.elem(pos);
    display(cout, ns, pos, elem_val);
    cout << ns << endl;
    cout << *(ns.sequence()) << endl;
    ns.display() << '\n' << endl;
  }
  return 0;
}