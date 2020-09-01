#include "NumSeq.h"

using namespace std;

// const int NumSequence::cnt_seq = 7;
const int NumSequence::max_seq = 64;
vector<vector<unsigned int>> NumSequence::seq(cnt_seq);
map<string,NumSequence::ns_type> NumSequence::seq_map;

NumSequence::PtrType NumSequence::func_tbl[cnt_seq] = {
  0,
  &NumSequence::fibonacci,
  &NumSequence::pell,
  &NumSequence::lucas,
  &NumSequence::triangular,
  &NumSequence::square,
  &NumSequence::pentagonal
};

ostream &operator << (ostream &os, const NumSequence &ns) {
  ns.print(os);
  return os;
}

/*
 * is_elem() returns true if the element passed in a valid element 
 * in the object's sequence. For example, if the object represents 
 * a fibonacci sequence { 1, 1, 2, 3, 5, 8, 13, 21, 34, 45}, beginning 
 * as position 3 for a length of 2, then
 *    Obj.is_elem( 1 ); // false
 *    Obj.is_elem( 3 ); // true
 *    Obj.is_elem( 5 ); // false
 *    Obj.is_elem( 4 ); // false
 */
bool NumSequence::is_elem(unsigned int elem) {
  if (!check_integrity(_length + _beg_pos - 1))
    return false;
  iterator bit, endit;
  begin(bit);
  end(endit);
  return binary_search(bit, endit, elem);
}

/*
 * pos_elem() returns the position of an element within the sequence 
 * independent of what the object's position and length. The object 
 * simply is used to identify the sequence for which to return a position. 
 * If the element value is invalid, return 0. For example, if the object 
 * represents a fibonacci sequence, then
 *     Obj.pos_elem( 1 ); // returns 1 - ignore duplicate
 *     Obj.pos_elem( 32 ); // returns 9
 *     Obj.pos_elem( very-large-instance ); // your choice
 *     Obj.pos_elem( 4 ); // return 0
 */
int NumSequence::pos_elem(unsigned int elem) {
  cout << "pos_elem( " << elem << " )\n";
  if (!check_integrity(1))
    return 0;

  vector<unsigned int> &this_seq = seq[_isa];
  iterator iter;

  if ((*_elem)[_elem->size()-1] < elem)
    return _calc_pos( elem );

  if ((iter = find(_elem->begin(), _elem->end(), elem)) == _elem->end())
    return 0;
  else
    return distance(_elem->begin(), iter) + 1;
}

int NumSequence::_calc_pos(unsigned int elem) {
  // presumption is that check_integrity() has passed
  int pos = _elem->size() - 1;

  cout << "calc_pos invoked()!: elem: " << elem 
       << " pos: " << pos 
       << " at: "  << (*_elem)[pos] << endl;

  while ((pos < max_seq) && ((*_elem)[pos] < elem)) {
    (this->*_pmf)(++pos);
    cout << " pos: " << pos 
         << " at: "  << (*_elem)[pos] << endl;
  }

  return ((pos < max_seq) && ((*_elem)[pos] == elem)) ? pos+1 : 0;
}

// implement of specific number sequences
void NumSequence::fibonacci(int pos) {   
  if (pos <= 0 || pos > max_seq)
    return;

  if (_elem->empty()) {
    _elem->push_back(1);
    _elem->push_back(1); 
  }

  if (_elem->size() <= pos) {
    int ix = _elem->size();
    int n_2 = (*_elem)[ix-2], n_1 = (*_elem)[ix-1];

    int elem;
    for (; ix <= pos; ++ix) {
      elem = n_2 + n_1; 
      _elem->push_back(elem);
      n_2 = n_1; n_1 = elem;
    }
  }
}
  
void NumSequence::pell(int pos) {    
  if (pos <= 0 || pos > max_seq)
    return;

  if (_elem->empty()) {
    _elem->push_back(1);
    _elem->push_back(2);
  }

  if (_elem->size() <= pos) {
    int ix = _elem->size();
    int n_2 = (*_elem)[ix-2], n_1 = (*_elem)[ix-1];

    int elem;
    for (; ix <= pos; ++ix) {
      elem = n_2 + 2 * n_1; 
      _elem->push_back(elem);
      n_2 = n_1; n_1 = elem;
    }
  }
}
  
void NumSequence::lucas(int pos) {     
  if (pos <= 0 || pos > max_seq)
    return;

  if (_elem->empty()) {
    _elem->push_back(1);
    _elem->push_back(3);
  }

  if (_elem->size() <= pos) {
    int ix = _elem->size();
    int n_2 = (*_elem)[ix-2], n_1 = (*_elem)[ix-1];

    int elem;
    for (; ix <= pos; ++ix) {
      elem = n_2 +  n_1; 
      _elem->push_back(elem);
      n_2 = n_1; n_1 = elem;
    }
  }
}    
  
void NumSequence::triangular(int pos) {
  if (pos <= 0 || pos > max_seq)
    return;

  if (_elem->size() <= pos) {
    int end_pos = pos+1;
    int ix = _elem->size()+1;
    for (; ix <= end_pos; ++ix)
      _elem->push_back(ix*(ix+1)/2);
  }
}

void NumSequence::square(int pos) {
  if (pos <= 0 || pos > max_seq)
    return;

  if (_elem->size() <= pos) {
    int end_pos = pos + 1;
    int ix = _elem->size()+1;
    for (; ix <= end_pos; ++ix)
      _elem->push_back(ix*ix);
  }
}   
  
void NumSequence::pentagonal(int pos) {
  if (pos <= 0 || pos > max_seq)
    return;

  if (_elem->size() <= pos) {
    int end_pos = pos + 1;
    int ix = _elem->size()+1;
    for (; ix <= end_pos; ++ix)
      _elem->push_back(ix*(3*ix-1)/2);
  }
}
