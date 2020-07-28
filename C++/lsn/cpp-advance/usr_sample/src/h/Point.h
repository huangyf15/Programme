//Point.h
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
  void move(int newX, int newY);
  friend float dist(const Point &a, const Point &b);
  static void showCount();
private:
  int x, y;
  static int count;
};
#endif//_POINT_H

