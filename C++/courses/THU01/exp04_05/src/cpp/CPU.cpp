#include "CPU.h"

CPU::CPU(CPU_Rank r, int f, float v) {
  _rank = r;
  _frequency = f;
  _voltage = v;
  cout << "Construct a CPU! (simple)" << endl; 
}

CPU::CPU(const CPU &c) {
  _rank = c._rank;
  _frequency = c._frequency;
  _voltage = c._voltage;
  cout << "Construct a CPU! (copy)" << endl; 
}