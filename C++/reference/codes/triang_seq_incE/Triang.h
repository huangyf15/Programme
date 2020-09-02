#ifndef __TRIANG_H__
#define __TRIANG_H__

#include <iostream>
#include <vector>

using namespace std;

class Triangular_iterator {
 public:
  Triangular_iterator(int index) : _index(index-1) {}

  bool operator == (const Triangular_iterator &) const;
  bool operator != (const Triangular_iterator &) const;
  int operator * () const;
  Triangular_iterator &operator ++ ();   // prefix version
  Triangular_iterator operator ++ (int); // postfix version

 private:
  void check_integrity() const;
  int _index;
};

class iterator_overflow {
 public:
  iterator_overflow(int index, int max) : _index(index), _max(max) {}

  int index() const { return _index; }
  int max() const { return _max; }

  void what_happened(ostream &os = cerr) {
    os << "Internal error: current index" << _index
       << " exceeds maximum bound: " << _max;
  }

 private:
  int _index, _max;
};

class Triangular {
  friend class Triangular_iterator;

 public:
  Triangular(int len = 1, int bp = 1);
  Triangular(const Triangular &rhs);
  Triangular& operator = (const Triangular &rhs);

  int length() const { return _length; }
  int beg_pos() const { return _beg_pos; }
  int elem(int pos) const { return _elems[pos-1]; }

  void length(const int nlen) { _length = nlen; }
  void beg_pos(const int npos) { _beg_pos = npos; }

  bool next(int &val) const;
  void next_reset() const;

  static bool is_elem(int);
  static void gen_elements(int length);
  static void gen_elems_to_value(int value);
  static void display(int length, int beg_pos, ostream &os = cout);

  typedef Triangular_iterator iterator;

  Triangular_iterator begin() const {
    return Triangular_iterator(_beg_pos);
  }
  Triangular_iterator end() const {
    return Triangular_iterator(_beg_pos + _length);
  }

 private:
  mutable int _next; // iterator-like integer, but not effective as iterator
  int _length, _beg_pos;
  
//  static const int _max_elems = 1024; // ok, but not VC++
  enum { _max_elems = 1024 };
  static vector<int> _elems;
};

ostream &operator << (ostream &os, const Triangular &);

istream &operator >> (istream &is, Triangular &);

int sum(const Triangular &rhs);

inline bool Triangular_iterator::operator == (const Triangular_iterator &rhs) const {
  return _index == rhs._index;
};

inline bool Triangular_iterator::operator != (const Triangular_iterator &rhs) const {
  return !(*this == rhs);
};

inline int Triangular_iterator::operator * () const {
  check_integrity();
  return Triangular::_elems[_index];
};

inline void Triangular_iterator::check_integrity() const {
  if (_index >= Triangular::_max_elems)
    throw iterator_overflow(_index, Triangular::_max_elems);
  
  if (_index >= Triangular::_elems.size())
    Triangular::gen_elements(_index);
};

inline Triangular_iterator &Triangular_iterator::operator ++ () {
  ++_index;
  check_integrity();
  return *this;
};

inline Triangular_iterator Triangular_iterator::operator ++ (int) {
  Triangular_iterator tmp = *this;
  ++_index;
  check_integrity();
  return tmp; 
};

#endif