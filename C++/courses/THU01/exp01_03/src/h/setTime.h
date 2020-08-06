#ifndef _SETTIME_H
#define _SETTIME_H

#include <iostream>
#include <iomanip>
using namespace std;

struct MyTimeStruct {
  unsigned int year;
  unsigned int month;
  unsigned int day;
  unsigned int hour;
  unsigned int min;
  unsigned int sec;
};

bool invalidateDay(int year, int month, int day);

void setTime();

#endif