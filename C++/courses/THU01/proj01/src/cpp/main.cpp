#include "Account.h"
#include "Controller.h"
#include "Date.h"

#include <iostream>
#include <fstream>

using namespace std;

int main() {
  Date date(2008,11,1);
  Controller controller(date);
  string cmdLine;
  const char *FILE_NAME = "commands.txt";

  ifstream fileIn(FILE_NAME);
  if (fileIn) {
    while (getline(fileIn, cmdLine))
      controller.runCommand(cmdLine);
    fileIn.close();
  }

  ofstream fileOut(FILE_NAME, ios_base::app);
  cout << ">> Help:"
       << "\n  (a) add account \t(q) query      \t(s) show    \t(e) exit    "
       << "\n  (c) change day  \t(n) next month \t(d) deposit \t(w) withdraw"
       << "\n  (h) help (see also 'x -h')"
       << "\n" << endl;
  while (!controller.isEnd()) {
    cout << controller.getDate() << "\tTotal: " << Account::getTotal() << "\tcommand> ";
    string cmdLine;
    getline(cin, cmdLine);
    if (controller.runCommand(cmdLine))
      fileOut << cmdLine << endl;
  }
  
  return 0;
}