#include "SavingsAccount.h"
#include "Error.h"

#include <iostream>
#include <cmath>

using namespace std;

double SavingsAccount::total = 0;

SavingsAccount::SavingsAccount(Date date, string id, double rate)
    : id(id), balance(0), rate(rate), lastDate(date), accumulation(0) {
  date.show();
  cout << "!! #" << id << " is created." << endl;
}

void SavingsAccount::deposit(const Date &date, const double &amount, 
                             const string &desc) {
  record(date, amount, desc);
}

void SavingsAccount::withdraw(const Date &date, double amount, 
                              const string &desc) {
  if (amount > getBalance()) {
    Error::error("Not enough money");
  } else {
    record(date, -amount, desc); 
  }
}

void SavingsAccount::settle(Date date) {
  double interest = accumulate(date) * rate / 365;
  if (interest != 0)
    record(date, interest, "interest");
  accumulation = 0;
}

void SavingsAccount::show() const {
  cout << "!! #" << id << "\tBalance: " << balance << endl;
}

void SavingsAccount::record(const Date &date, const double &amount,
                            const string &desc) {
  accumulation = accumulate(date);
  lastDate = date;
  double amount_floor = floor(amount * 100 + 0.5) / 100;
  balance += amount_floor;
  total += amount_floor;
  date.show();
  cout << ">> #" << id
    << "\tamount: " << amount_floor << "\tbalance: " << balance
    << "\tmessage: " << desc << endl;
}