#ifndef EXP01_03_SETTIME_H_
#define EXP01_03_SETTIME_H_

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