#ifndef EXP04_COMPUTER_H_
#define EXP04_COMPUTER_H_

#include "computer/CPU.h"
#include "computer/RAM.h"
#include "computer/CD_ROM.h"

class Computer {
 public:
  Computer(CPU c, RAM r, CD_ROM cd, unsigned int s, unsigned int b);
  ~Computer() { cout << "Destruct a Computer!" << endl; }

  void Run() {
    my_cpu.Run();
    my_ram.Run();
    my_cd_rom.Run();
    cout << "Computer begins!" << endl;
  }
  void Stop() {
    my_cpu.Stop();
    my_ram.Stop();
    my_cd_rom.Stop();
    cout << "Computer stops!" << endl;
  }

 private:
  CPU my_cpu;
  RAM my_ram;
  CD_ROM my_cd_rom;
  unsigned int storage_size; // in GB
  unsigned int bandwidth;    // in MB
};

#endif