#ifndef __NUMERICSEQ_H__
#define __NUMERICSEQ_H__

#include <string>
#include <vector>
#include <iostream>

using namespace std;

template <void (*pf)(int pos, vector<int> &seq)>
class NumericSequence {
 public:
  NumericSequence(int len, int beg_pos = 1) {
    if (!pf)
      cerr << "Error: null pointer to function!";
    _len = len > 0 ? len : 1;
    _beg_pos = beg_pos > 0 ? beg_pos : 1;
    pf(beg_pos+len-1, _elems);
  }

  int length() const { return _len; }
  int beg_pos() const { return _beg_pos; }
  vector<int> elems() const { return _elems; }

 private:
  int _len, _beg_pos;
  vector<int> _elems;
};

template <void (*pf)(int pos, vector<int> &seq)>
ostream &operator << (ostream &os, const NumericSequence<pf> &numseq) {
  int elem_pos = numseq.beg_pos() - 1;
  int end_pos = elem_pos + numseq.length();
  
  while (elem_pos < end_pos)
    os << numseq.elems()[elem_pos++] << ' ';

  return os;
}

void fibonacci(int pos, vector<int> &seq) {
  if (seq.empty()) {
    seq.push_back(1);
    seq.push_back(1); 
  }

  if (seq.size() <= pos) {
    int ix = seq.size();
    int n_2 = seq[ix-2], n_1 = seq[ix-1];

    int elem;
    for (; ix <= pos; ++ix) {
      elem = n_2 + n_1; 
      seq.push_back(elem);
      n_2 = n_1; n_1 = elem;
    }
  }
}

#endif