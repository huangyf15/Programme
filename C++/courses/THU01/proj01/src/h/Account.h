#ifndef PROJ01_ACCOUNT_H_
#define PROJ01_ACCOUNT_H_

#include "Date.h"
#include "Accumulator.h"

#include <string>
#include <map>
#include <istream>

using namespace std;

class Account;

class AccountRecord {
 public:
  AccountRecord(const Date &date, const Account *account, double amount,
                double balance, const string &desc);
  void show() const;

 private:
  Date date;
  const Account* account;
  double amount;
  double balance;
  string desc;
};

typedef multimap<Date, AccountRecord> RecordMap;

class Account {
 public:
  const string &getId() const { return _id; }
  double getBalance() const { return _balance; }
  static double getTotal() { return _total; }

  virtual void deposit(const Date &date, const double &amount, 
                       const string &desc) = 0;
  virtual void withdraw(const Date &date, double amount, 
                        const string &desc) = 0;
  virtual void settle(const Date &date) = 0;
  virtual void show(ostream &out) const;
  static void query(const Date &begin, const Date &end);

 protected:
  Account(Date date, string id);
  void record(const Date &date, const double &amount, const string &desc);

 private:
  string _id;
  double _balance;
  static double _total;
  static RecordMap recordMap;
};

inline ostream & operator << (ostream &out, const Account &account) {
  account.show(out);
  return out;
}

class SavingsAccount : public Account {
 public:
  SavingsAccount(Date date, string id, double rate);
  double getRate() const { return _rate; }

  virtual void deposit(const Date &date, const double &amount, 
                       const string &desc);
  virtual void withdraw(const Date &date, double amount, const string &desc);
  virtual void settle(const Date &date);

 private:
  double _rate;
  Accumulator _acc;
};

class CreditAccount : public Account {
 public:
  CreditAccount(Date date, string id, double credit, double rate, double fee);
  double getDebt() const {
    double balance = getBalance();
    return (balance < 0) ? balance : 0;
  }
  double getRate() const { return _rate; }
  double getCredit() const { return _credit; }
  double getFee() const { return _fee; }
  double getAvailableCredit() const {
    if (getBalance() < 0)
      return _credit + getBalance();
    else 
      return _credit;
  };

  virtual void deposit(const Date &date, const double &amount, 
                       const string &desc);
  virtual void withdraw(const Date &date, double amount, const string &desc);
  virtual void settle(const Date &date);
  virtual void show(ostream &out) const;

 private:
  double _rate;
  double _credit;
  double _fee;
  Accumulator _acc;
};

#endif