#ifndef FIBON_NUMSEQ_H_
#define FIBON_NUMSEQ_H_

#include <iostream>
#include <string>
#include <vector>

using namespace std;

void display_message(const string &, const char &, ostream & = cout);

void display_message(const string &, const int &, const char &,
                     ostream & = cout);

void display_message(const string &, const int &, const string &, const int &,
                     ostream & = cout);

template <typename elemType>
void display_message(const string &, const vector<elemType> &, ostream & = cout);

const vector<int> *fibon_seq(const int &);
const vector<int> *lucas_seq(const int &);
const vector<int> *pell_seq(const int &);
const vector<int> *triang_seq(const int &);
const vector<int> *square_seq(const int &);
const vector<int> *pent_seq(const int &);
const int seq_cnt = 6;

enum ns_type {
  ns_fibon, ns_lucas, ns_pell, ns_triang, ns_square, ns_pent
};

extern const int max_seq_size[seq_cnt];

extern const vector<int> * (*seq_array[seq_cnt])(const int &);

inline bool is_seq_num_ok(const int &seq_num) {
  if (seq_num < 0 || seq_num >= seq_cnt) {
    display_message("Requested size of seq_num is not supported: ", seq_num, '\n', cerr);
    return false;
  };
  return true;
}

inline bool is_size_ok(const int &size, const int &seq_num) {
  if (size <= 0 || size > max_seq_size[seq_num]) {
    display_message("Requested size of seq is not supported: ", size, '\n', cerr);
    return false;
  };
  return true;
}

bool seq_elem(int, int &, const vector<int> * (*seq_ptr)(const int &) = fibon_seq);

#endif
