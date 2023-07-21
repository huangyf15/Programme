#ifndef __NUMSEQ_H__
#define __NUMSEQ_H__

#include <string>
#include <vector>
#include <iostream>

using namespace std;

class NumSequence {
 public:
  virtual ~NumSequence();

  int elem(int pos) const;
  ostream &print(ostream &os = cout) const;

  int length() const { return _length; }
  int beg_pos() const { return _beg_pos; }
  const string &seq_name() const { return _name; }
  static int max_elems() { return _max_elems; }

 protected:
  virtual void gen_elems(int pos) const = 0;
  bool check_integrity(int pos, int size) const;

  NumSequence(int len, int bp, vector<unsigned int> &re, const string &name)
      : _length(len), _beg_pos(bp), _relems(re), _name(name) {}
  
  int _length, _beg_pos;
  string _name;
  vector<unsigned int> &_relems;
  static const int _max_elems = 64;
};

inline NumSequence::~NumSequence() {}

inline void display(const NumSequence &ns, int pos, ostream &os = cout) {
  os << "The element at position " << pos << " for the " << ns.seq_name()
     << " sequence is " << ns.elem(pos) << endl;
}

ostream &operator << (ostream &os, const NumSequence &ns);

#endif