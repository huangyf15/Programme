#include "Clock.h"

#include <iostream>
#include <iomanip>

using namespace std;

Clock::Clock(int newH, int newM, int newS)
    : hour(newH), minute(newM), second(newS) {}

Clock::Clock(const Clock &c) {
  hour = c.hour;
  minute = c.minute;
  second = c.second;
}

Clock::~Clock() {}

void Clock::setTime(int newH, int newM, int newS) {
  hour = newH;
  minute = newM;
  second = newS;
}

void Clock::showTime() {
  cout << "Time is set to: " 
    << setw(2) << setfill('0') << hour << ":"
    << setw(2) << setfill('0') << minute << ":"
    << setw(2) << setfill('0') << second << endl;
}
