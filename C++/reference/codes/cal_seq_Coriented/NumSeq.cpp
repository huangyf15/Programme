#include "NumSeq.h"

using namespace std;

int NumSequence::elem(int pos) const {
  if (!check_integrity(pos, _relems.size()))
    return 0;

  return _relems[pos-1];
}

ostream &NumSequence::print(ostream &os) const {
  int elem_pos = _beg_pos - 1;
  int end_pos = elem_pos + _length;

  if (end_pos > _relems.size())
    gen_elems(end_pos);

  while (elem_pos < end_pos)
    os << _relems[elem_pos++] << ' ';

  return os;
}

bool NumSequence::check_integrity(int pos, int size) const {
  if (pos <= 0 || pos > _max_elems) {
    cerr << "!! Invalid position: " << pos << "Cannot honor request\n";
    return false;
  }

  if (pos > size)
    gen_elems(pos);

  return true;
}

ostream &operator << (ostream &os, const NumSequence &ns) {
  return ns.print(os);
}
