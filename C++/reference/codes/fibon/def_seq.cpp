#include "NumSeq.h"

#include <iostream>
#include <string>
#include <vector>

using namespace std;

const vector<int> *fibon_seq(const int &size) {
  static vector<int> elems;
  for (int ix = elems.size(); ix < size; ++ix) {
    if (ix == 0 || ix == 1)
      elems.push_back(1);
    else
      elems.push_back(elems[ix-1] + elems[ix-2]);
  };
  display_message("Fibonacci seq now: ", elems, clog);
  return &elems;
}

const vector<int> *lucas_seq(const int &size) {
  static vector<int> elems;
  for (int ix = elems.size(); ix < size; ++ix) {
    switch (ix) {
      case 0:
        elems.push_back(1);
        break;
      case 1:
        elems.push_back(3);
        break;
      default:
        elems.push_back(elems[ix-1] + elems[ix-2]);
        break;
    };
  };
  display_message("Lucas seq now: ", elems, clog);
  return &elems;
}

const vector<int> *pell_seq(const int &size) {
  static vector<int> elems;
  for (int ix = elems.size(); ix < size; ++ix) {
    switch (ix) {
      case 0:
        elems.push_back(1);
        break;
      case 1:
        elems.push_back(2);
        break;
      default:
        elems.push_back(2*elems[ix-1] + elems[ix-2]);
        break;
    };
  };
  display_message("Pell seq now: ", elems, clog);
  return &elems;
}

const vector<int> *triang_seq(const int &size) {
  static vector<int> elems;
  for (int ix = elems.size(); ix < size; ++ix) {
    if (ix == 0)
      elems.push_back(1);
    else
      elems.push_back(elems[ix-1] + ix);
  };
  display_message("Triangular seq now: ", elems, clog);
  return &elems;
}

const vector<int> *square_seq(const int &size) {
  static vector<int> elems;
  for (int ix = elems.size(); ix < size; ++ix) {
    elems.push_back(ix*ix);
  };
  display_message("Pentagonal seq now: ", elems, clog);
  return &elems;
}

const vector<int> *pent_seq(const int &size) {
  static vector<int> elems;
  for (int ix = elems.size(); ix < size; ++ix) {
    elems.push_back(ix*(3*ix-1)/2);
  };
  display_message("Pentagonal seq now: ", elems, clog);
  return &elems;
}

const int max_seq_size[seq_cnt] = {46, 44, 25, 8192, 8192, 8192};

const vector<int> * (*seq_array[])(const int &) = {
  fibon_seq, lucas_seq, pell_seq, triang_seq, square_seq, pent_seq
};

bool seq_elem(int pos, int &elem, const vector<int> *(*seq_ptr)(const int &)) {
  if (!seq_ptr)
    display_message("Internal Error: seq_ptr is set to nullptr!", '\n', cerr);
  
  const vector<int> *pseq = seq_ptr(pos);
  if (!pseq) {
    elem = 0;
    return false;
  }
  elem = (*pseq)[pos-1];
  return true;
}

void display_message(const string &msg, const char &ch, ostream &os) {
  os << msg << ch;
}

void display_message(const string &msg, const int &num, const char &ch,
                     ostream &os) {
  os << msg << num << ch;
}

void display_message(const string &msg1, const int &num1, const string &msg2,
                     const int &num2, ostream &os) {
  os << msg1 << num1 << msg2 << num2 << endl;
}

template <typename elemType>
void display_message(const string &msg, const vector<elemType> &vec, ostream &os) {
  os << msg;
  for (int ix = 0; ix < vec.size(); ++ix) {
    elemType t = vec[ix];
    os << t << ' ';
  }
  os << endl;
}
