#include "Accumulator.h"

#include <cmath>
#include <iostream>

using namespace std;

Accumulator::Accumulator(const Date &date, const double &value)
    : _date(date), _value(value), _sum(0) {}

double Accumulator::getSum(const Date &date) const {
  return _sum + _value * (date - _date);
}

void Accumulator::change(const Date &date, const double &value) {
  _sum += _value * (date - _date);
  _date = date;
  _value = value;
}

void Accumulator::reset(const Date &date, const double &value) {
  _sum = 0;
  _date = date;
  _value = value;
}
