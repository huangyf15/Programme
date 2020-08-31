#ifndef __NUMSEQ_H__
#define __NUMSEQ_H__

#include <map>
#include <string>
#include <vector>
#include <utility>
#include <iterator>
#include <iostream>
#include <algorithm>

using namespace std;

class num_sequence {
 public:
  // typedef related
  typedef vector<unsigned int>::iterator iterator;
  typedef void (num_sequence::*PtrType) (int);

  // ns_type related (_pmf addresses one of these)
  void fibonacci(int);
  void pell(int);
  void lucas(int);
  void triangular(int);
  void square(int);
  void pentagonal(int);

  enum ns_type { 
    ns_unset,
    ns_fibonacci, ns_pell, ns_lucas,
    ns_triangular, ns_square, ns_pentagonal 
  };

  static int num_of_sequence() { return cnt_seq; }

  static ns_type to_ns_type(int num) {
    return num <= 0 || num > cnt_seq ? ns_unset : static_cast<ns_type>(num);
  }
  
  static ns_type seq_type(const char *ps) {
    if (seq_map.empty())
      seq_map["fibonacci"] = ns_fibonacci;
      seq_map["pell"] = ns_pell;   
      seq_map["lucas"] = ns_lucas;
      seq_map["triangular"] = ns_triangular; 
      seq_map["square"] = ns_square; 
      seq_map["pentagonal"] = ns_pentagonal;
    string nm(ps);
    return seq_map.count(nm) ? seq_map[nm] : ns_unset;
  }

  const string seq_name() const {
    static string names[cnt_seq] = {
      "not set",
      "fibonacci",
      "pell",
      "lucas",
      "triangular",
      "square",
      "pentagonal"
    };
    return names[_isa];
  }

  // constructor related
  void set_position(int pos) {
    if (pos <= 0 || pos > max_seq) {
      cerr << "!! Invalid position: " << pos 
           << " setting pos to default value of 1\n"
           << "If inadequate, invoke set_position(pos)\n";
      pos = 1;
    }
    _beg_pos = pos;
  }

  void set_length(int len) {
    if (len <= 0 || len + _beg_pos - 1 > max_seq){
      cerr << "!! Invalid length for this object: " << len 
           << " setting length to default value of 1\n"
           << "If inadequate, invoke set_length(len)\n";
      len = 1;
    }
    _length = len;
  }

  void set_sequence(ns_type nst) {
    switch (nst) {
    default:
      cerr << "!! Invalid type: setting to 0\n";
    case ns_unset:
      _pmf = 0;
      _elem = 0;
      _isa = ns_unset;
      break;
    case ns_fibonacci:  case ns_pell:   case ns_lucas:
    case ns_triangular: case ns_square: case ns_pentagonal:
      _pmf = func_tbl[nst];
      _elem = &seq[nst];
      _isa = nst;
      break;
    }
  }

  /* 
   * Note: do not need a copy constructor, copy assignment operator
   *       or a destructor for the num-sequence class ...
   */
  num_sequence(int beg_pos = 1, int len = 1, ns_type nst = ns_unset) {	
    set_position(beg_pos);
    set_length(len);
    set_sequence(nst);
  }

  // operator overloaded
  bool operator == (const num_sequence &rhs) const {
    return (_beg_pos == rhs._beg_pos) && (_length  == rhs._length);
  }

  bool operator != (const num_sequence &rhs) const {
    return !(*this == rhs);
  }

  num_sequence operator + (const num_sequence &rhs) {
    return num_sequence(_beg_pos < rhs._beg_pos ? _beg_pos : rhs._beg_pos,
                        _length + rhs._length,
                        _isa == rhs._isa ? _isa : ns_unset );
  }
  
  // interface to elem, beg_pos, length and sequence
  bool check_integrity(int pos) const {
    if ((pos <= 0) || (pos > max_seq) || (pos > _length + _beg_pos - 1)) {
      cerr << "!! Invalid position: " << pos << " Cannot honor request\n";
      return false;
    }
    if (_isa == ns_unset) {
      cerr << "!! Object is not set to a sequence."
           << " Please set_sequence() and try again!\n";
      return false;
    }
    if (pos > _elem->size()) {
      cout << "Check_integrity: calculating " << pos - _elem->size()
           << " additional elements\n";
      (const_cast<num_sequence *>(this)->*_pmf)(pos);
    }
    return true;
  }

  int elem(int pos) const { return check_integrity(pos) ? (*_elem)[pos-1] : 0; }
  int beg_pos() const { return _beg_pos; }
  int length()  const { return _length;  }

  const vector<unsigned int> *sequence() const {
    if (!check_integrity(_length + _beg_pos - 1)) 
      return nullptr;
    return _elem;
  }

  ostream &print(ostream &os = cout) const {
    if (!check_integrity(_length + _beg_pos - 1))
      return os;
    int len = _beg_pos + _length - 1;
    for (int ix = _beg_pos - 1; ix < len; ++ix)
      os << (*_elem)[ix] << ' ';
    return os;
  }

  ostream &display(ostream &os = cout) const {
    if (!check_integrity(1))
      return os;
    for (int ix = 0; ix < _elem->size(); ++ix)
      os << (*_elem)[ix] << ' ';
    return os;
  }

  bool begin(iterator &iter) const { 
    if (!check_integrity(_length + _beg_pos - 1)) 
      return false; 
    iter = _elem->begin() + _beg_pos - 1;
    return true; 
  }

  bool end(iterator &iter) const { 
    if (!check_integrity(_length + _beg_pos - 1)) 
      return false;
    iter = _elem->begin() + _beg_pos - 1 + _length;  
    return true;
  }

  bool is_elem(unsigned int elem);
		
  int pos_elem(unsigned int elem);

 private:
  int _beg_pos;
  int _length;

  PtrType _pmf;
  ns_type _isa;
  vector<unsigned int> *_elem;
  
  int _calc_pos(unsigned int elem);

//  static const int cnt_seq = 7;
  enum { cnt_seq = 7 };
  static vector<vector<unsigned int>> seq;
  static PtrType func_tbl[cnt_seq];
  static const int max_seq;
  static map<string,ns_type> seq_map;
};

inline void display(ostream &os, const num_sequence &ns, int pos, int elem_val) {
  os << "The element at position " << pos 
     << " for the " << ns.seq_name() 
     << " sequence is " << elem_val << endl;
}

ostream &operator << (ostream &, const num_sequence &);

#endif