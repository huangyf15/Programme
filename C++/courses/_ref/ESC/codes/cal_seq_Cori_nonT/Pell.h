#ifndef __PELL_H__
#define __PELL_H__

#include "NumSeq.h"

#include <vector>

class Pell : public NumSequence {
 public:
  Pell(int len = 1, int beg_pos = 1)
      : NumSequence(len, beg_pos, _elems, "Pell") {}
  Pell(const Pell &rhs) : NumSequence(rhs) {}

 protected:
  virtual void gen_elems(int pos) const;
  static vector<unsigned int> _elems;
};

#endif