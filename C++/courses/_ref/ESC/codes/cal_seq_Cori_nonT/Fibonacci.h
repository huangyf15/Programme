#ifndef __FIBONACCI_H__
#define __FIBONACCI_H__

#include "NumSeq.h"

#include <vector>

class Fibonacci : public NumSequence {
 public:
  Fibonacci(int len = 1, int beg_pos = 1)
      : NumSequence(len, beg_pos, _elems, "Fibonacci") {}

 protected:
  virtual void gen_elems(int pos) const;
  static vector<unsigned int> _elems;
};

#endif