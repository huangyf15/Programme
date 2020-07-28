#include <iostream>
#include <unistd.h>
using namespace std;

int main() {
  uid_t uid = getuid();
  uid_t euid = geteuid();
  cout << uid << " " << euid << endl;
  return 0;
}

