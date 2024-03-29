#ifndef EXP05_COMPUTER_H_
#define EXP05_COMPUTER_H_

#include "CPU.h"
#include "RAM.h"
#include "CD_ROM.h"

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
  unsigned int _storage_size; // in GB
  unsigned int _bandwidth;    // in MB
};

#endif