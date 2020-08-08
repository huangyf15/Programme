#ifndef PROJ01_SAVINGSACCOUNT_H_
#define PROJ01_SAVINGSACCOUNT_H_

#include "Date.h"

#include <string>
#include <vector>

using namespace std;

class SavingsAccount {
 public:
  SavingsAccount(Date date, string id, double rate);
  string getId() const { return id; }
  double getBalance() const { return balance; }
  double getRate() const {return rate; }

  // 存入现金
  void deposit(const Date &date, const double &amount, const string &desc);
  // 取出现金
  void withdraw(const Date &date, double amount, const string &desc);
  // 结算利息，每年1月1日调用一次该函数
  void settle(Date date);
  // 显示账户信息
  void show() const;
  // 获得账户总金额
  static double getTotal() { return total; }

 private:
  string id;
  double balance;
  double rate;
  Date lastDate;
  double accumulation;
  static double total;

  // 记录一笔账，date 为日期，amount 为金额，desc 为说明
  void record(const Date &date, const double &amount, const string &desc);
  // 获取到指定日期为止的存款金额按日累计值
  double accumulate(Date date) const {
    return accumulation + balance * date.distance_rel(lastDate);
  }
};

#endif