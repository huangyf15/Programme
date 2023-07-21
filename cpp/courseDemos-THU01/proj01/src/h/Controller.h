#ifndef PROJ01_CONTROLLER_H_
#define PROJ01_CONTROLLER_H_

#include "Account.h"
#include "Date.h"
#include <vector>

struct deleter {
  template <class T> void operator () (T* p) { delete p; }
};

class Controller {
 public:
  Controller(const Date &date) : date(date), end(false) { }
  ~Controller();
  const Date &getDate() const { return date; }
  bool isEnd() const { return end; }
  bool runCommand(const string &cmdLine);

 private:
  Date date;
  vector<Account *> accounts;
  bool end;
};

#endif