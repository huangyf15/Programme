#include "Account.h"
#include "Array.h"
#include "Date.h"

#include <iostream>

using namespace std;

int main() {
  Date date(2008,11,1);
  Array<Account*> accounts(0);

  cout << ">> Help:\n\t(a) add account \n\t(d) deposit \n\t(w) withdraw \n\t(s) show "
       << "\n\t(c) change day \n\t(n) next month \n\t(e) exit \n" << endl;
  char cmd;
  do {
    cout << date.getDate() << "\tTotal: " << Account::getTotal() << "\tcommand> ";

    char type;
    int index, day;
    double amount, credit, rate, fee;
    string id, desc;
    Account *account;

    cin >> cmd;
    switch (cmd) {
      case 'a':
        cout << "Please successively input: type id [Enter]"
             << "\n\ttype = s: Savings Account"
             << "\n\t       c: Credit Account" << endl;
        cin >> type >> id;
        if (type == 's') {
          cout << "Please input: rate [Press Enter to Confirm]" << endl;
          cin >> rate;
          account = new SavingsAccount(date, id, rate);
        } else if (type == 'c'){
          cout << "Please successively input: credit rate fee "
               << "[Press Enter to Confirm]" << endl;
          cin >> credit >> rate >> fee;
          account = new CreditAccount(date, id, credit, rate, fee);
        } else {
          cout << "Invalid type of account. Input again." << endl;
        }
        if ((type == 's') || (type == 'c')) {
          accounts.resize(accounts.getSize() + 1);
          accounts[accounts.getSize() - 1] = account;
        }
        break;
      case 'd':
        cout << "Please successively input: index amount "
              << "[Press Enter to Confirm]" << endl;
        cin >> index >> amount;
        getline(cin, desc);
        accounts[index]->deposit(date, amount, desc);
        break;
      case 'w':
        cout << "Please successively input: index amount "
              << "[Press Enter to Confirm]" << endl;
        cin >> index >> amount;
        getline(cin, desc);
        accounts[index]->withdraw(date, amount, desc);
        break;
      case 's':
        for (int i = 0; i < accounts.getSize(); i++) {
          cout << "[" << i << "]";
          accounts[i]->show();
          cout << endl;
        }
        break;
      case 'c':
        cout << "Please input: day [Press Enter to Confirm]" << endl;
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
        for (int i = 0; i < accounts.getSize(); i++)
          accounts[i]->settle(date);
        break;
    }
  } while (cmd != 'e');

  for (int i = 0; i < accounts.getSize(); i++)
    delete accounts[i];

  return 0;
}