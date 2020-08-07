#include "computer/RAM.h"

RAM::RAM(RAM_Type t, unsigned int f, unsigned int s)
    : type(t), frequency(f), size(s) {
  cout << "Construct a RAM! (simple)" << endl; 
};

RAM::RAM(const RAM &r) {
  type = r.type;
  frequency = r.frequency;
  size = r.size;
  cout << "Construct a RAM! (copy)" << endl; 
}