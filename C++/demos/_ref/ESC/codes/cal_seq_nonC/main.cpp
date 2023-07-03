#include "NumSeq.h"

#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
  char next_seq_ch = 'y';
  bool next_seq = true;
  int seq_num, seq_pos, elem;
  while (next_seq) {
    display_message("Please enter a seq num:", ' ');
    cin >> seq_num;
    while (!is_seq_num_ok(seq_num)) {
      display_message("Please enter a seq num again:", ' ');
      cin >> seq_num;
    }
    
    display_message("Please enter a position:", ' ');
    cin >> seq_pos;
    while (!is_size_ok(seq_pos, seq_num)) {
      display_message("Please enter a seq pos again:", ' ');
      cin >> seq_pos;
    }

    const vector<int> * (*seq_ptr)(const int &) = seq_array[seq_num];
    if (seq_elem(seq_pos, elem, seq_ptr))
      display_message("element # ", seq_pos, " is ", elem);
    else
      display_message("Sorry. Could not calculate element # ", seq_pos, '\n');
    
    display_message("Continue or not? [Y/N]", '\t');
    cin >> next_seq_ch;
    next_seq = (next_seq_ch == 'y' || next_seq_ch == 'Y') ? true : false;
  }  

  return 0;
}