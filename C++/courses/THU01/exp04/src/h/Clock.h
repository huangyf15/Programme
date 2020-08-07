#ifndef EXP04_CLOCK_H_
#define EXP04_CLOCK_H_

class Clock{
 public:
  Clock(int newH = 0, int newM = 0, int newS = 0);
  Clock(const Clock &c);
  ~Clock();

  int getHour() const { return hour; }
  int getMinute() const { return minute; }
  int getSecond() const { return second; }

  void setHour(int newH) { hour = newH; }
  void setMinute(int newM) { minute = newM; }
  void setSecond(int newS) { second = newS; }

  void setTime(int newH, int newM, int newS);
  void showTime();

 private:  
  int hour, minute, second;
};

#endif