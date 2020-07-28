#include <iostream>
#include <stdexcept>
#include <limits>
using namespace std;
class Clock{
public:
  Clock(int newH, int newM, int newS); // 构造函数
  Clock();                             // 默认构造函数
  Clock(const Clock &c);               // 复制构造函数
  ~Clock();                            // 析构函数
  void setTime(int newH = 0, int newM = 0, int newS = 0);
  void showTime() const;
  Clock& operator ++ ();   //前置单目运算符重载，返回的是左值
  Clock operator ++ (int); //后置单目运算符重载，返回的是右值

private:
  int hour, minute, second;
  void judgeOutOfRange();
};

void Clock::judgeOutOfRange() {
  if (!(0 <= hour && hour < 24 && 0 <= minute && minute < 60
    && 0 <= second && second < 60))
    throw invalid_argument("*** Error: Time-setting out of range!");
}

Clock::Clock(int hour = 0, int minute = 0, int second = 0) {
  this->hour = hour;
  this->minute = minute;
  this->second = second;
  judgeOutOfRange();
}

Clock::Clock(): Clock(0,0,0) { }

Clock::Clock(const Clock &c){
  hour = c.hour;
  minute = c.minute;
  second = c.second;
  judgeOutOfRange();
}

Clock::~Clock() {
}

void Clock::setTime(int newH, int newM, int newS) {
  hour = newH;
  minute = newM;
  second = newS;
  judgeOutOfRange();
}

void Clock::showTime() const {
  cout << hour << ":" << minute << ":" << second << endl;
}

Clock & Clock::operator ++ () {
  second++;
  if (second >= 60) {
    second -= 60;  minute++;
    if (minute >= 60) {
      minute -= 60; hour = (hour + 1) % 24;
    }
  }
  return *this;
}

Clock Clock::operator ++ (int) {
  Clock old = *this;
  ++(*this);  // 保证定义的一致性
  return old;
}
int main() {
  try {
    Clock myClock(23, 59, 61);
    cout << "First time output: ";
    myClock.showTime();
    cout << "Show myClock++:    ";
    (myClock++).showTime();
    cout << "Show ++myClock:    ";
    (++myClock).showTime();
  }

  catch(invalid_argument& e) {
    cerr << e.what() << endl;
    return -1;
  }

  return 0;
}

