#ifndef PROJ01_ACCUMULATOR_H_
#define PROJ01_ACCUMULATOR_H_

#include "Date.h"

class Accumulator {
 public:
  Accumulator(const Date &date, const double &value);
  double getSum(const Date &date) const;
  void change(const Date &date, const double &value);
  void reset(const Date &date, const double &value);

 private:
  Date _date;
  double _value;
  double _sum;
};

#endif