#ifndef __NUMSEQ_H__
#define __NUMSEQ_H__

#include <string>
#include <vector>
#include <iostream>

using namespace std;

template <int len, int beg_pos>
class NumSequence;

template <int len, int beg_pos>
ostream &operator << (ostream &os, const NumSequence<len,beg_pos> &ns);

template <int len, int beg_pos>
class NumSequence {
 public:
  virtual ~NumSequence();

  int elem(int pos) const;
  ostream &print(ostream &os = cout) const;

  const string &seq_name() const { return _name; }
  static int max_elems() { return _max_elems; }

 protected:
  virtual void gen_elems(int pos) const = 0;
  bool check_integrity(int pos, int size) const;

  NumSequence(vector<unsigned int> &re, const string &name)
      : _relems(re), _name(name) {}
  
  string _name;
  vector<unsigned int> &_relems;
  static const int _max_elems = 64;
};

template <int len, int beg_pos>
inline NumSequence<len,beg_pos>::~NumSequence() {}

template <int len, int beg_pos>
inline void display(const NumSequence<len,beg_pos> &ns, int pos, ostream &os = cout) {
  os << "The element at position " << pos << " for the " << ns.seq_name()
     << " sequence is " << ns.elem(pos) << endl;
}

template <int len, int beg_pos>
int NumSequence<len,beg_pos>::elem(int pos) const {
  if (!check_integrity(pos, _relems.size()))
    return 0;

  return _relems[pos-1];
}

template <int len, int beg_pos>
ostream &NumSequence<len,beg_pos>::print(ostream &os) const {
  int elem_pos = beg_pos - 1;
  int end_pos = elem_pos + len;

  if (end_pos > _relems.size())
    gen_elems(end_pos);

  while (elem_pos < end_pos)
    os << _relems[elem_pos++] << ' ';

  return os;
}

template <int len, int beg_pos>
bool NumSequence<len,beg_pos>::check_integrity(int pos, int size) const {
  if (pos <= 0 || pos > _max_elems) {
    cerr << "!! Invalid position: " << pos << "Cannot honor request\n";
    return false;
  }

  if (pos > size)
    gen_elems(pos);

  return true;
}

template <int len, int beg_pos>
ostream &operator << (ostream &os, const NumSequence<len,beg_pos> &ns) {
  return ns.print(os);
}

#endif