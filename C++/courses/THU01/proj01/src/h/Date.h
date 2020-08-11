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
  const std::string &getDate() const { return _date; }

  int getMaxDay(const int &year, const int &month) const;
  static bool isLeapYear(const int &year);
  static Date read();

  // Return relative distance to 1/01/01
  int distance_abs() const;
  // Return relative distance to another date
  int operator- (const Date &anotherDate) const;
  bool operator< (const Date &anotherDate) const;

 private:
  int _year, _month, _day;
  std::string _date;
};

#endif