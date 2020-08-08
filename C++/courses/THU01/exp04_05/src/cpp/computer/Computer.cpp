#include "computer/Computer.h"

Computer::Computer(CPU c, RAM r, CD_ROM cd, unsigned int s, unsigned int b)
    : my_cpu(c), my_ram(r), my_cd_rom(cd) {
  storage_size = s;
  bandwidth = b;
  cout << "Construct a Computer! (simple)" << endl; 
};