#include "Account.h"
#include "Date.h"

#include <iostream>

using namespace std;

int main() {
  Date date(2008,11,1);
  SavingsAccount sa1(date, "S3755217", 0.015);
  SavingsAccount sa2(date, "S2342342", 0.015);
  CreditAccount ca(date, "C5392394", 10000, 0.0005, 50);
  Account *accounts[] = { &sa1, &sa2, &ca};
  const int n = sizeof(accounts) / sizeof(Account*);

  cout << ">> Help:\n\t(d) deposit\n\t(w) withdraw\n\t(s) show"
       << "\n\t(c) change day\n\t(n) next month\n\t(e) exit\n" << endl;
  char cmd;
  do {
    cout << date.getDate() << "\tTotal: " << Account::getTotal() << "\tcommand> ";

    int index, day;
    double amount;
    string desc;

    cin >> cmd;
    switch (cmd) {
      case 'd':
        cin >> index >> amount;
        getline(cin, desc);
        accounts[index] -> deposit(date, amount, desc);
        break;
      case 'w':
        cin >> index >> amount;
        getline(cin, desc);
        accounts[index] -> withdraw(date, amount, desc);
        break;
      case 's':
        for (int i = 0; i < n; i++) {
          cout << "[" << i << "]";
          accounts[i]->show();
          cout << endl;
        }
        break;
      case 'c':
        cin >> day;
        if (day < date.getDay())
          cout << "You cannot specify a previous day!\n";
        else if (day > date.getMaxDay(date.getYear(), date.getMonth()))
          cout << "Invalid day for present month!\n";
        else
          date = Date(date.getYear(), date.getMonth(), day);
        break;
      case 'n':
        if (date.getMonth() == 12)
          date = Date(date.getYear() + 1, 1, 1);
        else
          date = Date(date.getYear(), date.getMonth()+1, 1);
        for (int i = 0; i < n; i++)
          accounts[i]->settle(date);
        break;
    }
  } while (cmd != 'e');
  return 0;
}