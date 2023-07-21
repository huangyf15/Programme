#include "CD_ROM.h"

CD_ROM::CD_ROM(Interface_Type t, unsigned int c, Install_Method m) {
  _type = t;
  _cache_size = c;
  _method = m;
  cout << "Construct a CD_ROM! (simple)" << endl;
};

CD_ROM::CD_ROM(const CD_ROM &cd) {
  _type = cd._type;
  _cache_size = cd._cache_size;
  _method = cd._method;
  cout << "Construct a CD_ROM! (copy)" << endl; 
}