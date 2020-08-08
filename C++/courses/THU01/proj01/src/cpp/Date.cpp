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
  string dateStr = to_string(_year)+"/"+to_string(_month)+"/"+to_string(_day);
  if (year <= 0 || year > 2500) {
    Error::error("Invalid year (1~2500): " + dateStr);
  } else if (month <= 0 || month > 12) {
    Error::error("Invalid month: " + dateStr);
  } else if (day <= 0 || day > getMaxDay(year,month)) {
    Error::error("Invalid day: "+ dateStr);
  }
}

int Date::getMaxDay(const int &year, const int &month) const {
  int maxDay = DAYS_BEFORE_MONTH[month] - DAYS_BEFORE_MONTH[month-1];
  if ((month == 2) && isLeapYear(year)) {
    maxDay += 1;
  }
  return maxDay;
}

bool Date::isLeapYear(const int &year) const {
  if (year % 4 == 0)
    if (year % 100 == 0)
      if (year % 400 == 0)
        return true;
      else 
        return false;
    else
      return true;
}

void Date::show() const {
  cout << _year << "/"
    << setw(2) << setfill('0') << _month << "/"
    << setw(2) << setfill('0') << _day << endl;
}

int Date::distance_abs() const {
  int yr_pass = _year - 1;
  int distance = 365 * yr_pass + DAYS_BEFORE_MONTH[_month] + _day;
  distance += floor(yr_pass/4.0) - floor(yr_pass/100.0) + floor(yr_pass/400.0);
  if ((_month > 2) && isLeapYear(_year))
    distance += 1;
  return distance;
}

int Date::distance_rel(const Date &anotherDate) const {
  return distance_abs() - anotherDate.distance_abs();
}
