#include "Controller.h"

#include <iostream>
#include <sstream>
#include <algorithm>

using namespace std;

Controller::~Controller() {
  for_each(accounts.begin(), accounts.end(), deleter());
}

bool Controller::runCommand(const string &cmdLine) {
  istringstream str(cmdLine);
  bool helpFlag = (cmdLine.find("-h") != string::npos);
  char cmd, type;
  int index, day;
  double amount, credit, rate, fee;
  string id, desc;
  Account* account;
  Date date1, date2;

  str >> cmd;
  switch (cmd) {
    case 'h': 
      cout << ">> Help:"
           << "\n  (a) add account \t(q) query      \t(s) show    \t(e) exit    "
           << "\n  (c) change day  \t(n) next month \t(d) deposit \t(w) withdraw"
           << "\n  (h) help (see also 'x -h')"
           << "\n" << endl;
      return false;
    case 'a':
      if (helpFlag) {
        cout << "Please successively input: type id data [Enter]"
             << "\n\ttype = s: Savings Account, data = rate"
             << "\n\t       c: Credit Account, data = credit rate fee"
             << "\n" << endl;
        return false;
      }
      str >> type >> id;
      if (type == 's') {
        str >> rate;
        account = new SavingsAccount(date, id, rate);
        accounts.push_back(account);
        return true;
      } else if (type == 'c'){
        str >> credit >> rate >> fee;
        account = new CreditAccount(date, id, credit, rate, fee);
        accounts.push_back(account);
        return true;
      } else {
        cout << "Invalid type of account. Input again." << endl;
        return false;
      }
    case 'd':
      if (helpFlag) {
        cout << "Please successively input: index amount [Enter]\n" << endl;
        return false;
      }
      str >> index >> amount;
      getline(str, desc);
      accounts[index]->deposit(date, amount, desc);
      return true;
    case 'w':
      if (helpFlag) {
        cout << "Please successively input: index amount [Enter]\n" << endl;
        return false;
      }
      str >> index >> amount;
      getline(str, desc);
      accounts[index]->withdraw(date, amount, desc);
      return true;
    case 's':
      if (helpFlag) {
        cout << "\n" << endl;
        return false;
      }
      for (int i = 0; i < accounts.size(); i++) {
        cout << "[" << i << "]" << *accounts[i]<< endl;
      }
      return false;
    case 'c':
      if (helpFlag) {
        cout << "Please input: day [Enter]\n" << endl;
        return false;
      }
      str >> day;
      if (day < date.getDay())
        cout << "You cannot specify a previous day!\n";
      else if (day > date.getMaxDay(date.getYear(), date.getMonth()))
        cout << "Invalid day for present month!\n";
      else
        date = Date(date.getYear(), date.getMonth(), day);
      return true;
    case 'n':
      if (helpFlag) {
        cout << "\n" << endl;
        return false;
      }
      if (date.getMonth() == 12)
        date = Date(date.getYear() + 1, 1, 1);
      else
        date = Date(date.getYear(), date.getMonth() + 1, 1);
      for (vector<Account*>::iterator iter = accounts.begin(); 
                                      iter != accounts.end(); ++iter)
        (*iter)->settle(date);
      return true;
    case 'q':
      if (helpFlag) {
        cout << "Please successively input: date_begin, date_ending"
             << "\n\tdate = year/month/day" << "\n" << endl;
        return false;
      }
      str >> date1 >> date2;
      Account::query(date1, date2);
      return false;
    case 'e':
      if (helpFlag) {
        cout << "\n" << endl;
        return false;
      }
      end = true;
      return false;
  }
	cout << "Invalid command: " << cmdLine << endl;
	return false;
}