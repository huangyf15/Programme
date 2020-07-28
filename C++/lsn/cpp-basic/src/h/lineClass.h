//lineClass.h
#ifndef _POINT_H
#define _POINT_H
class Point {
public:
  Point();
  Point(int x, int y);
  Point(const Point &p);
  ~Point();
  int getX() { return x; }
  int getY() { return y; }
  friend float dist(const Point &a, const Point &b); // 友元函数
  static void showCount();
private:
  int x, y;
  static int count;
};
#endif//_POINT_H

#ifndef _LINE_H
#define _LINE_H
class Line {
public:
  Line();
  Line(Point xp1, Point xp2);
  Line(const Line &l);
  ~Line();
  double getLen() { return len; }
private:
  Point p1, p2;
  double len;
};
#endif//_LINE_H
