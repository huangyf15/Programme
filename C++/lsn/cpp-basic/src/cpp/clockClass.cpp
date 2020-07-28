#include <iostream>
using namespace std;
class Clock{
public:
  Clock(int newH, int newM, int newS); // 构造函数
  Clock();                             // 默认构造函数
  Clock(const Clock &c);               // 复制构造函数
  ~Clock();                            // 析构函数
  void setTime(int newH = 0, int newM = 0, int newS = 0);
  void showTime();
private:
  int hour, minute, second;
};

Clock::Clock(int newH, int newM, int newS):
  hour(newH), minute(newM), second(newS){
  }

Clock::Clock(): Clock(0,0,0){}

Clock::Clock(const Clock &c){
  hour = c.hour;
  minute = c.minute;
  second = c.second;
}

Clock::~Clock() {
}

void Clock::setTime(int newH, int newM, int newS) {
  hour = newH;
  minute = newM;
  second = newS;
}

void Clock::showTime() {
  cout << hour << ":" << minute << ":" << second << endl;
}


int main() {
  Clock c(1,1,1);
  c.showTime();
  return 0;
}
