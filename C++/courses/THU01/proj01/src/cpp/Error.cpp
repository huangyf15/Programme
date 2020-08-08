#include "Error.h"

#include <iostream>
#include <string>

using namespace std;

void Error::error(string msg) {
  cout << "** Error: " << msg << endl;
  exit(1);
}