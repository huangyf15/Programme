#include "Date.h"
#include "Error.h"

#include <iostream>
#include <iomanip>
#include <string>
#include <cstdlib>
#include <cmath>

using namespace std;

namespace {
const int DAYS_BEFORE_MONTH[] = {0, 31, 59, 90, 120, 151, 181, 212, 243, 273,
                                 304, 334, 365};
}

Date::Date(int year, int month, int day)
    : _year(year), _month(month), _day(day) {
  string yearStr = to_string(_year);
  string monthStr = to_string(_month);
  string dayStr = to_string(_day);
  if (year <= 0 || year > 2500) {
    Error::error("Invalid year (1~2500): " + yearStr);
  } else if (month <= 0 || month > 12) {
    Error::error("Invalid month: " + yearStr + "/" + monthStr);
  } else if (day <= 0 || day > getMaxDay(year,month)) {
    Error::error("Invalid day: "+ yearStr + "/" + monthStr + "/" + dayStr);
  }
  if (int ms = monthStr.size() < 2) monthStr = string(2 - ms, '0') + monthStr;
  if (int ds = dayStr.size() < 2) dayStr = string(2 - ds, '0') + dayStr;
  _date = yearStr + "/" + monthStr + "/" + dayStr;
}

int Date::getMaxDay(const int &year, const int &month) const {
  int maxDay = DAYS_BEFORE_MONTH[month] - DAYS_BEFORE_MONTH[month-1];
  if ((month == 2) && isLeapYear(year)) {
    maxDay += 1;
  }
  return maxDay;
}

bool Date::isLeapYear(const int &year) {
  return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
}

Date Date::read() {
  int year, month, day;
  cin >> year >> month >> day;
  return Date(year, month, day);
}

int Date::distance_abs() const {
  int yr_pass = _year - 1;
  int mo_pass = _month - 1;
  int distance = 365 * yr_pass + DAYS_BEFORE_MONTH[mo_pass] + _day;
  distance += floor(yr_pass/4.0) - floor(yr_pass/100.0) + floor(yr_pass/400.0);
  if ((_month > 2) && isLeapYear(_year))
    distance += 1;
  return distance;
}

int Date::operator- (const Date &anotherDate) const {
  return this->distance_abs() - anotherDate.distance_abs();
}

bool Date::operator< (const Date &anotherDate) const {
  return (this->distance_abs() < anotherDate.distance_abs());
}
