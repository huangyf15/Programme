#ifndef PROJ01_ACCOUNT_H_
#define PROJ01_ACCOUNT_H_

#include "Date.h"
#include "Accumulator.h"

#include <string>

using namespace std;

class Account {
 public:
  const string &getId() const { return _id; }
  double getBalance() const { return _balance; }
  void show() const;
  static double getTotal() { return _total; }

 protected:
  Account(Date date, string id);
  void record(const Date &date, const double &amount, const string &desc);

 private:
  string _id;
  double _balance;
  static double _total;
};

class SavingsAccount : public Account {
 public:
  SavingsAccount(Date date, string id, double rate);
  double getRate() const { return _rate; }

  void deposit(const Date &date, const double &amount, const string &desc);
  void withdraw(const Date &date, double amount, const string &desc);
  void settle(Date date);

  void show() const;

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

  void deposit(const Date &date, const double &amount, const string &desc);
  void withdraw(const Date &date, double amount, const string &desc);
  void settle(Date date);

  void show() const;

 private:
  double _rate;
  double _credit;
  double _fee;
  Accumulator _acc;
};

#endif