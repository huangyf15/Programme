#include "Account.h"
#include "Date.h"

#include <iostream>

using namespace std;

int main() {
  Date date(2008,11,1);
  /*
  SavingsAccount accounts[] = {
    SavingsAccount(date, "S3755217", 0.015),
    SavingsAccount(date, "02342342", 0.015)
  };
  */
  SavingsAccount sa1(date, "S3755217", 0.015);
  SavingsAccount sa2(date, "S2342342", 0.015);
  CreditAccount ca(date, "C5392394", 10000, 0.0005, 50);

  sa1.deposit(Date(2008,11,5), 5000, "salary");
  ca.withdraw(Date(2008,11,15), 2000, "buy a cell");
  sa2.deposit(Date(2008,11,25), 10000, "sell stock 0323");

  ca.settle(Date(2008,12,1));
  ca.deposit(Date(2008,12,1), 2016, "repay the credit");
  sa1.deposit(Date(2008,12,5), 5500, "salary");

  sa1.settle(Date(2009,1,1));
  sa2.settle(Date(2009,1,1));
  ca.settle(Date(2009,1,1));

  cout << endl;
  sa1.show();
  sa2.show();
  ca.show();
  cout << "Total: " << Account::getTotal() << endl;

  return 0;
}