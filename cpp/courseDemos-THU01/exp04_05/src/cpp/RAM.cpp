#include "RAM.h"

RAM::RAM(RAM_Type t, unsigned int f, unsigned int s)
    : _type(t), _frequency(f), _size(s) {
  cout << "Construct a RAM! (simple)" << endl; 
};

RAM::RAM(const RAM &r) {
  _type = r._type;
  _frequency = r._frequency;
  _size = r._size;
  cout << "Construct a RAM! (copy)" << endl; 
}