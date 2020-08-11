#include "Account.h"
#include "Error.h"

#include <cmath>
#include <utility>
#include <iostream>

using namespace std;
using namespace std::rel_ops;

AccountRecord::AccountRecord(const Date &date, const Account *account, 
                             double amount, double balance, const std::string& desc)
    : date(date), account(account), amount(amount), balance(balance), desc(desc) {}

void AccountRecord::show() const {
  cout << date.getDate() << "\t#" << account->getId() << "\t" << amount 
       << "\t" << balance << "\t" << desc << endl;
}

double Account::_total = 0;
RecordMap Account::recordMap;
Account::Account(Date date, string id) : _id(id), _balance(0) {
  cout << date.getDate() << "\t#" << id << " is created." << endl;
}

void Account::record(const Date &date, const double &amount,
                     const string &desc) {
  double amount_floor = floor(amount * 100 + 0.5) / 100;
  _balance += amount_floor;
  _total += amount_floor;
	AccountRecord record(date, this, amount_floor, _balance, desc);
	recordMap.insert(make_pair(date, record));
  cout << ">> " << date.getDate() << "\t#" << _id
    << "\tamount: " << amount_floor << "\tbalance: " << _balance
    << "\tmessage: " << desc << endl;
}

void Account::show() const {
  cout << "\t#" << _id << "\tBalance: " << _balance;
}

void Account::query(const Date& begin, const Date& end) {
  if (begin <= end) {
    RecordMap::iterator iter1 = recordMap.lower_bound(begin);
    RecordMap::iterator iter2 = recordMap.upper_bound(end);
    for (RecordMap::iterator iter = iter1; iter != iter2; ++iter)
      iter->second.show();
  }
}

SavingsAccount::SavingsAccount(Date date, string id, double rate)
    : Account(date,id), _rate(rate), _acc(date,0) {}

void SavingsAccount::deposit(const Date &date, const double &amount, 
                             const string &desc) {
  record(date, amount, desc);
  _acc.change(date, getBalance());
}

void SavingsAccount::withdraw(const Date &date, double amount, 
                              const string &desc) {
  if (amount > getBalance())
    Error::error("Not enough money");
  else
    record(date, -amount, desc);
    _acc.change(date, getBalance());
}

void SavingsAccount::settle(const Date &date) {
  if (date.getMonth() == 1) {
    int maxDay = Date::isLeapYear(date.getYear() - 1)? 366 : 365;
    double interest = _acc.getSum(date) * _rate / maxDay;
    if (interest != 0)
      record(date, interest, "interest");
    _acc.reset(date, getBalance());
  }
}

void SavingsAccount::show() const {
  Account::show();
  cout << endl;
}

CreditAccount::CreditAccount(Date date, string id, double credit, 
                             double rate, double fee)
    : Account(date,id), _credit(credit), _rate(rate), _fee(fee), _acc(date,0) {}

void CreditAccount::deposit(const Date &date, const double &amount, 
                            const string &desc) {
  record(date, amount, desc);
  _acc.change(date, getDebt());
}

void CreditAccount::withdraw(const Date &date, double amount, 
                             const string &desc) {
  if (amount - getBalance() > _credit)
    Error::error("Not enough credit");
  else
    record(date, -amount, desc);
    _acc.change(date, getDebt());
}

void CreditAccount::settle(const Date &date) {
  if (date.getDay() == 1) {
    double interest = (_acc.getSum(date) * _rate);
    if (interest != 0)
      record(date, interest, "interest");
    if (date.getMonth() == 1)
      record(date, -_fee, "annual fee");
    _acc.reset(date, getDebt());
  }
}

void CreditAccount::show() const {
  Account::show();
  cout << "\tAvailable credit: " << getAvailableCredit() << endl;
}
