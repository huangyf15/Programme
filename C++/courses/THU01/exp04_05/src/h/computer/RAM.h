#ifndef EXP04_RAM_H_
#define EXP04_RAM_H_

#include <iostream>

using namespace std;

enum RAM_Type {DDR2=2, DDR3, DDR4};

class RAM {
 public:
  RAM(RAM_Type t, unsigned int f, unsigned int s);
  RAM() : RAM(DDR2,1600,8) { cout << "Construct a RAM! (default)" << endl; }
  RAM(const RAM &r);
  ~RAM() { cout << "Destruct a RAM!" << endl; }


  RAM_Type getType() const { return type; }
  unsigned int getFrequency() const { return frequency; }
  unsigned int getSize() const { return size; }

  void setType(RAM_Type t) { type = t; }
  void setFrequency(unsigned int f) { frequency = f; }
  void setSize(unsigned int s) { size = s; }

  void Run() { cout << "RAM begins!" << endl; }
  void Stop() { cout << "RAM stops!" << endl; }

 private:
  RAM_Type type;
  unsigned int frequency;  // in MHz
  unsigned int size;       // in GB
};

#endif