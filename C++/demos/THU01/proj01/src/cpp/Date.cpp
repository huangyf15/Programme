#include "Date.h"

#include <iostream>
#include <iomanip>
#include <string>
#include <cstdlib>
#include <cmath>
#include <stdexcept>

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
    throw runtime_error("Invalid year (1~2500): " + yearStr);
  } else if (month <= 0 || month > 12) {
    throw runtime_error("Invalid month: " + yearStr + "/" + monthStr);
  } else if (day <= 0 || day > getMaxDay(year,month)) {
    throw runtime_error("Invalid day: "+ yearStr + "/" + monthStr + "/" + dayStr);
  }
  
  if (int ms = monthStr.size() < 2) monthStr = string(2 - ms, '0') + monthStr;
  if (int ds = dayStr.size() < 2) dayStr = string(2 - ds, '0') + dayStr;
  _date = yearStr + "/" + monthStr + "/" + dayStr;

  int yr_pass = _year - 1;
  int mo_pass = _month - 1;
  _totalDays = 365 * yr_pass + DAYS_BEFORE_MONTH[mo_pass] + _day;
  _totalDays += floor(yr_pass/4.0) - floor(yr_pass/100.0) + floor(yr_pass/400.0);
  if ((_month > 2) && isLeapYear(_year)) _totalDays += 1;
}

int Date::getMaxDay(const int &year, const int &month) const {
  if (isLeapYear(year) && month == 2)
    return 29;
  else
    return DAYS_BEFORE_MONTH[month]- DAYS_BEFORE_MONTH[month - 1];
}

int Date::operator - (const Date &anotherDate) const {
  return this->_totalDays - anotherDate.getTotalDays();
}

bool Date::operator < (const Date &anotherDate) const {
  return (this->_totalDays < anotherDate.getTotalDays());
}

istream & operator >> (istream &in, Date &date) {
	int year, month, day;
	char c1, c2;
	in >> year >> c1 >> month >> c2 >> day;
  if (c1 != '/' || c2 != '/')
    throw runtime_error("Bad date format (year/month/date)\n");
	date = Date(year, month, day);
	return in;
}

ostream & operator << (ostream &out, const Date &date) {
	out << date.getDate();
	return out;
}