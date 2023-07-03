#include "const.h"

#include <iostream>

using namespace std;

void display_extern_int_sub() {
  cout << "extern_int: " << extern_int << endl;
}

void display_const_int_sub() {
  cout << "const_int: " << const_int << endl;
}

void display_extern_const_int_sub() {
  cout << "extern_const_int: " << ex_const_int << endl;
}
