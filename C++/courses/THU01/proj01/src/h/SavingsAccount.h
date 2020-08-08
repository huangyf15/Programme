#ifndef PROJ01_SAVINGSACCOUNT_H_
#define PROJ01_SAVINGSACCOUNT_H_

#include <iostream>
#include <cmath>

using namespace std;

class SavingsAccount {
 public:
  SavingsAccount(int date, int id, double rate);
  int getId() const { return id; }
  double getBalance() const { return balance; }
  double getRate() const {return rate; }

  // 存入现金
  void deposit(int date, double amount);
  // 取出现金
  void withdraw(int date, double amount);
  // 结算利息，每年1月1日调用一次该函数
  void settle(int date);
  // 显示账户信息
  void show();

 private:
  int id;
  double balance;
  double rate;
  int lastDate;
  double accumulation;

  // 记录一笔账，date 为日期，amount 为金额，desc 为说明
  void record(int date, double amount);
  // 获取到指定日期为止的存款金额按日累计值
  double accumulate(int date) const {
    return accumulation + balance * (date - lastDate);
  }
};

#endif