#include <iostream>
#include <vector>
#include <algorithm>

#include "Triang.h"

using namespace std;
vector<int> Triangular::_elems;

Triangular::Triangular(int len, int beg_pos)
    : _length(len > 0 ? len : 1), _beg_pos(beg_pos > 0 ? beg_pos : 1) {
  _next = _beg_pos - 1;
  int elem_cnt = _beg_pos + _length;
  if(_elems.size() < elem_cnt)
    gen_elements(elem_cnt);
}

Triangular::Triangular(const Triangular &rhs)
    : _length(rhs._length), _beg_pos(rhs._beg_pos), _next(rhs._beg_pos - 1) {}

Triangular &Triangular::operator = (const Triangular &rhs) {
  if (this != &rhs) { 
    _length = rhs._length;
    _beg_pos = rhs._beg_pos;
    _next = _beg_pos - 1;
  }
  return *this;
};

ostream &operator << (ostream &os, const Triangular &rhs) {
  os << "(" << rhs.beg_pos() << ", " << rhs.length() << ") ";
  rhs.display(rhs.length(), rhs.beg_pos(), os);
  return os;
}

istream &operator >> (istream &is, Triangular &rhs) {
  int bp, len;
  
  cout << "Please input the begin position: ";
  is >> bp;
  cout << "Please input the sequence length: ";
  is >> len;

  rhs.beg_pos(bp);
  rhs.length(len);
  rhs.next_reset();

  return is;
}

void Triangular::next_reset() const {
  _next = _beg_pos - 1;
}

bool Triangular::next(int &value) const {
  if (_next < _beg_pos + _length - 1) {
    value = _elems[_next++];
    return true;
  }
  _next = 0;
  return false;
}

bool Triangular::is_elem(int value) {
  if (!_elems.size() || _elems[_elems.size()-1] < value)
    gen_elems_to_value(value);
  
  vector<int>::iterator found_it;
  vector<int>::iterator end_it = _elems.end();

  found_it = find(_elems.begin(), end_it, value);
  return found_it != end_it;
}

void Triangular::gen_elements(int length) {
  if (length < 0 || length > _max_elems)
    cerr << "Triangular Sequences: length too large "
         << length << " -- exceeds max size of " << _max_elems << endl;
  if (_elems.size() < length) {
    int ix = _elems.size() ? _elems.size() + 1 : 1;
    for (; ix <= length; ++ix)
      _elems.push_back(ix*(ix+1)/2);
  }
}

void Triangular::gen_elems_to_value(int value) {
  int ix = _elems.size();
  if (!ix) {
    _elems.push_back(1);
    ix = 1;
  }
  while (_elems[ix-1] < value && ix < _max_elems) {
    ++ix;
    _elems.push_back(ix*(ix+1)/2);
  }
  if (ix == _max_elems)
    cerr << "Triangular Sequences: value too large "
         << value << " -- exceeds max size of " << _max_elems << endl;
}

void Triangular::display(int length, int beg_pos, ostream &os) {
  if (length <= 0 || beg_pos <= 0) {
    cerr << "Invalid parameters -- unable to fulfill request: "
         << length << ", " << beg_pos << endl;
    return;
  }
  int elems = beg_pos + length - 1;
  if (_elems.size() < elems)
    gen_elements(elems);
  for (int ix = beg_pos-1; ix < elems; ++ix)
    os << _elems[ix] << ' ';
}
