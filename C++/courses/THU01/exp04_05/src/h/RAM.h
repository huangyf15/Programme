#ifndef EXP05_RAM_H_
#define EXP05_RAM_H_

#include <iostream>

using namespace std;

enum RAM_Type {DDR2=2, DDR3, DDR4};

class RAM {
 public:
  RAM(RAM_Type t, unsigned int f, unsigned int s);
  RAM() : RAM(DDR2,1600,8) { cout << "Construct a RAM! (default)" << endl; }
  RAM(const RAM &r);
  ~RAM() { cout << "Destruct a RAM!" << endl; }

  RAM_Type getType() const { return _type; }
  unsigned int getFrequency() const { return _frequency; }
  unsigned int getSize() const { return _size; }

  void setType(RAM_Type t) { _type = t; }
  void setFrequency(unsigned int f) { _frequency = f; }
  void setSize(unsigned int s) { _size = s; }

  void Run() { cout << "RAM begins!" << endl; }
  void Stop() { cout << "RAM stops!" << endl; }

 private:
  RAM_Type _type;
  unsigned int _frequency;  // in MHz
  unsigned int _size;       // in GB
};

#endif