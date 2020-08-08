#include "computer/CPU.h"

CPU::CPU(CPU_Rank r, int f, float v) {
  rank = r;
  frequency = f;
  voltage = v;
  cout << "Construct a CPU! (simple)" << endl; 
}

CPU::CPU(const CPU &c) {
  rank = c.rank;
  frequency = c.frequency;
  voltage = c.voltage;
  cout << "Construct a CPU! (copy)" << endl; 
}