#include "ExamInfo.h"

#include <iostream>

using namespace std;

void ExamInfo::show() {
  cout << name << ": ";
  switch (mode) {
    case GRADE:
      cout << grade << endl;
      break;
    case PASS:
      cout << (pass ? "PASS" : "FAIL") << endl;
      break;
    case PERCENTAGE:
      cout << percent << endl;
      break;
  }
}