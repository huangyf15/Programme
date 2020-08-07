#ifndef EXP04_CD_ROM_H_
#define EXP04_CD_ROM_H_

#include <iostream>

using namespace std;

enum Interface_Type {SATA, USB};

enum Install_Method {external, built_in};

class CD_ROM {
 public:
  CD_ROM(Interface_Type t, unsigned int c, Install_Method m);
  CD_ROM() : CD_ROM(SATA,2,built_in)  { cout << "Construct a CD_ROM! (default)" << endl; }
  CD_ROM(const CD_ROM &cd);
  ~CD_ROM()  { cout << "Destruct a CD_ROM!" << endl; }

  Interface_Type getType() const { return type; }
  unsigned int getCapacity() const { return cache_size; }
  Install_Method getMethod() const { return method; }

  void setType(Interface_Type t) { type = t; }
  void setCapacity(unsigned int c) { cache_size = c; }
  void setMethod(Install_Method m) { method = m; }

  void Run() { cout << "CD_ROM begins!" << endl; }
  void Stop() { cout << "CD_ROM stops!" << endl; }

 private:
  Interface_Type type;
  unsigned int cache_size; // in MB
  Install_Method method;
};

#endif