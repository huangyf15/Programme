#ifndef PROJ01_DATE_H_
#define PROJ01_DATE_H_

#include <string>

class Date {
 public:
  Date(int year, int month, int day);
  Date() : Date(1,1,1) {};
  int getYear() const { return _year; }
  int getMonth() const { return _month; }
  int getDay() const { return _day; }
  int getTotalDays() const { return _totalDays; }
  const std::string &getDate() const { return _date; }

  int getMaxDay(const int &year, const int &month) const;
  static bool isLeapYear(const int &year) {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }
  
  int operator - (const Date &anotherDate) const;
  bool operator < (const Date &anotherDate) const;

 private:
  int _year, _month, _day;
  int _totalDays;
  std::string _date;
};

std::istream & operator >> (std::istream &in, Date &date);

std::ostream & operator << (std::ostream &out, const Date &date);

#endif