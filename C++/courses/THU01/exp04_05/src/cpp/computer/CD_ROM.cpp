#include "computer/CD_ROM.h"

CD_ROM::CD_ROM(Interface_Type t, unsigned int c, Install_Method m) {
  type = t;
  cache_size = c;
  method = m;
  cout << "Construct a CD_ROM! (simple)" << endl;
};

CD_ROM::CD_ROM(const CD_ROM &cd) {
  type = cd.type;
  cache_size = cd.cache_size;
  method = cd.method;
  cout << "Construct a CD_ROM! (copy)" << endl; 
}