#include "Account.h"
#include "Date.h"

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct deleter {
  template <class T> void operator () (T* p) { delete p; }
};

int main() {
  Date date(2008,11,1);
  vector<Account *> accounts;

  cout << ">> Help:\n\t(a) add account \n\t(s) show \n\t(e) exit \n\t(q) query"
       << "\n\t(c) change day \n\t(n) next month \n\t(d) deposit \n\t(w) withdraw " << endl;
  char cmd;
  do {
    cout << date.getDate() << "\tTotal: " << Account::getTotal() << "\tcommand> ";

    char type;
    int index, day;
    double amount, credit, rate, fee;
    string id, desc;
    Account *account;
    Date date1, date2;

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
          accounts.push_back(account);
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
        for (int i = 0; i < accounts.size(); i++) {
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
          date = Date(date.getYear(), date.getMonth() + 1, 1);
        for (vector<Account*>::iterator iter = accounts.begin(); 
                                        iter != accounts.end(); ++iter)
          (*iter)->settle(date);
        break;
      case 'q':
        cout << "Please input the beginning date: year month day "
             << "[Press Enter to Confirm]" << endl;
        date1 = Date::read();
        cout << "Please input the ending date: year month day "
             << "[Press Enter to Confirm]" << endl;
        date2 = Date::read();
        Account::query(date1, date2);
        break;
    }
  } while (cmd != 'e');
  for_each(accounts.begin(), accounts.end(), deleter());
  return 0;
}