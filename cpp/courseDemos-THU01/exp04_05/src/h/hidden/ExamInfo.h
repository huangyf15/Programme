#ifndef EXP04_EXAMINFO_H_
#define EXP04_EXAMINFO_H_

#include <string>

using namespace std;

class ExamInfo {
 public:
  ExamInfo(string xname, char xgrade):
    name(xname), mode(GRADE), grade(xgrade) {}
  ExamInfo(string xname, bool xpass):
    name(xname), mode(PASS), pass(xpass) {}
  ExamInfo(string xname, int xpercent):
    name(xname), mode(PERCENTAGE), percent(xpercent) {}
  void show();

 private:
  string name;
  enum { GRADE, PASS, PERCENTAGE } mode;
  union {
    char grade;
    bool pass;
    int percent;
  };
};

#endif