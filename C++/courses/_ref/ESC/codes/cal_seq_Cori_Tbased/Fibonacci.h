#ifndef __FIBONACCI_H__
#define __FIBONACCI_H__

#include "NumSeq.h"

#include <vector>

template <int len, int beg_pos=1>
class Fibonacci : public NumSequence<len,beg_pos> {
 public:
  Fibonacci() : NumSequence<len,beg_pos>(_elems, "Fibonacci") {}

 protected:
  virtual void gen_elems(int pos) const;
  static vector<unsigned int> _elems;
};

template <int len, int beg_pos>
vector<unsigned int> Fibonacci<len,beg_pos>::_elems;

template <int len, int beg_pos>
void Fibonacci<len,beg_pos>::gen_elems(int pos) const {
  //if (pos <= 0 || pos > max_elems())  return;

  if (_elems.empty()) {
    _elems.push_back(1);
    _elems.push_back(1); 
  }

  if (_elems.size() <= pos) {
    int ix = _elems.size();
    int n_2 = _elems[ix-2], n_1 = _elems[ix-1];

    int elem;
    for (; ix <= pos; ++ix) {
      elem = n_2 + n_1; 
      _elems.push_back(elem);
      n_2 = n_1; n_1 = elem;
    }
  }
}

#endif