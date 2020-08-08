#ifndef PROJ01_DATE_H_
#define PROJ01_DATE_H_

#include <cstring>
#include <string>

class Date {
 public:
  Date(int year, int month, int day);
  
  int getYear() const { return _year; }
  int getMonth() const { return _month; }
  int getDay() const { return _day; }
  int getMaxDay(const int &year, const int &month) const;
  bool isLeapYear(const int &year) const;
  void show() const;

  // Return relative distance to 1/01/01
  int distance_abs() const;
  // Return relative distance to another date
  int distance_rel(const Date &anotherDate) const;

 private:
  int _year, _month, _day;
};

#endif