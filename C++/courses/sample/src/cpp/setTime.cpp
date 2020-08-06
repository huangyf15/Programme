#include "setTime.h"

bool invalidateDay(int year, int month, int day) {
  bool invalidDayFlag = true;
  if (day > 0) {
    switch(month) {
      case 2:
        if (year % 4 == 0 && year % 100 != 0) {
          cout << "Year " << year << " is leap year." << endl;
          if (day <= 29) invalidDayFlag = false;
        } else {
          cout << "Year " << year << " is not leap year." << endl;
          if (day <= 28) invalidDayFlag = false;
        }
        break;
      case 4:
      case 6:
      case 9:
      case 11:
        if (day <= 30) invalidDayFlag = false;
        break;
      default:
        if (day <= 31) invalidDayFlag = false;
        break;
    }
  }
  return invalidDayFlag;
};

void setTime() {
  MyTimeStruct myTime={2000,01,01,00,00,00};

  cout << "Please input year: " << endl;
  cin >> myTime.year;
  while (myTime.year < 1900 || myTime.year >= 2100) {
    cout << "Error: Invalid year, needed in 1900-2099. \n Please input year again: " << endl;
    cin >> myTime.year;
  }

  cout << "Please input month: " << endl;
  cin >> myTime.month;
  while (myTime.month <= 0 || myTime.month >= 13) {
    cout << "Error: Invalid month, needed in 1-12. \n Please input month again: " << endl;
    cin >> myTime.month;
  }

  cout << "Please input day: " << endl;
  cin >> myTime.day;
  bool invalidDayFlag;
  invalidDayFlag = invalidateDay(myTime.year, myTime.month, myTime.day);
  while (invalidDayFlag) {
    cout << "Error: Invalid day. \n Please input day again: " << endl;
    cin >> myTime.day;
    invalidDayFlag = invalidateDay(myTime.year, myTime.month, myTime.day);
  }

  cout << "Please input hour: " << endl;
  cin >> myTime.hour;
  while (myTime.hour < 0 || myTime.hour >= 24) {
    cout << "Error: Invalid hour, needed in 0-23. \n Please input hour again: " << endl;
    cin >> myTime.hour;
  }

  cout << "Please input min: " << endl;
  cin >> myTime.min;
  while (myTime.min < 0 || myTime.min >= 60) {
    cout << "Error: Invalid min, needed in 0-59. \n Please input min again: " << endl;
    cin >> myTime.min;
  }

  cout << "Please input sec: " << endl;
  cin >> myTime.sec;
  while (myTime.sec < 0 || myTime.sec >= 60) {
    cout << "Error: Invalid sec, needed in 0-59. \n Please input sec again: " << endl;
    cin >> myTime.sec;
  }

  cout << "\nThe time is set to: "
       << setw(4) << setfill('0') << myTime.year  << "/"
       << setw(2) << setfill('0') << myTime.month << "/"
       << setw(2) << setfill('0') << myTime.day   << " "
       << setw(2) << setfill('0') << myTime.hour  << ":"
       << setw(2) << setfill('0') << myTime.min   << ":"
       << setw(2) << setfill('0') << myTime.sec   << endl;
}