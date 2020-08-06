#include "setTime.h"
#include "computeFib.h"
#include "max_reload.h"
#include <iostream>
using namespace std;

int main() {
  cout << max_reload(1,2) << endl;
  cout << max_reload(1,2,3) << endl;
  cout << max_reload(1.0,2.0) << endl;
  cout << max_reload(1.0,2.0,3.0) << endl;
  return 0;
}