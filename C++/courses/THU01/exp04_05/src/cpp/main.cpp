/*
#include "Clock.h"
#include "Point.h"
#include "Line.h"
#include "ExamInfo.h"
*/
#include "Computer.h"

#include <iostream>

using namespace std;

int main() {
/*
  // Class basics
  Clock c1(8,10,0);
  Clock c2;
  Clock c3 = c1;
  c1.showTime();
  c2.showTime();
  c3.showTime();
  c1.setTime(8, 30, 30);
  c1.showTime();
  c2.setHour(10);
  c2.showTime();

  // Class combination
  Point p1(1,2);
  Point p2;
  p1.showCoordinate();
  p2.showCoordinate();
  Point::showCount();
  showDistance(p1,p2);
  Line l1(p1,p2);
  l1.showLine();

  // struct, union and enum
  ExamInfo course1("English", 'B');
  ExamInfo course2("Calculus", true);
  ExamInfo course3("C++ Programming", 85);
  course1.show();
  course2.show();
  course3.show();
*/

  // Data protection ('const')
  CPU cpu1(P6,300,2.8);
  RAM ram1(DDR3,1600,8);
  CD_ROM cd_rom1(SATA,2,built_in);
  Computer computer1(cpu1,ram1,cd_rom1,128,10);
  computer1.Run();
  computer1.Stop();

  return 0;
}