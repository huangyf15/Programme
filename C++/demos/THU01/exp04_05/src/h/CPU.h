#ifndef EXP05_CPU_H_
#define EXP05_CPU_H_

#include <iostream>

using namespace std;

enum CPU_Rank {P1=1, P2, P3, P4, P5, P6, P7};

class CPU {
 public:
  CPU(CPU_Rank r, int f, float v);
  CPU() : CPU(P1,300,2.8) { cout << "Construct a CPU! (default)" << endl; }
  CPU(const CPU &c);
  ~CPU() { cout << "Destruct a CPU!" << endl; }

  CPU_Rank getRank() const { return _rank; }
  unsigned int getFrequency() const { return _frequency; }
  float getVoltage() const { return _voltage; }

  void setRank(CPU_Rank r) { _rank = r; }
  void setFrequency(unsigned int f) { _frequency = f; }
  void setVoltage(float v) { _voltage = v; }

  void Run() { cout << "CPU begins!" << endl; }
  void Stop() { cout << "CPU stops!" << endl; }

 private:
  CPU_Rank _rank;
  unsigned int _frequency;
  float _voltage;
};

#endif