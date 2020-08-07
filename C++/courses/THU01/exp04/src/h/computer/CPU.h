#ifndef EXP04_CPU_H_
#define EXP04_CPU_H_

#include <iostream>

using namespace std;

enum CPU_Rank {P1=1, P2, P3, P4, P5, P6, P7};

class CPU {
 public:
  CPU(CPU_Rank r, int f, float v);
  CPU() : CPU(P1,300,2.8) { cout << "Construct a CPU! (default)" << endl; }
  CPU(const CPU &c);
  ~CPU() { cout << "Destruct a CPU!" << endl; }

  CPU_Rank getRank() const { return rank; }
  unsigned int getFrequency() const { return frequency; }
  float getVoltage() const { return voltage; }

  void setRank(CPU_Rank r) { rank = r; }
  void setFrequency(unsigned int f) { frequency = f; }
  void setVoltage(float v) { voltage = v; }

  void Run() { cout << "CPU begins!" << endl; }
  void Stop() { cout << "CPU stops!" << endl; }

 private:
  CPU_Rank rank;
  unsigned int frequency;
  float voltage;
};

#endif