#ifndef EXP06_POINT_H_
#define EXP06_POINT_H_

class Point {
 public:
  Point() : _x(0), _y(0) {}
  Point(int x, int y) : _x(x), _y(y) {}
  Point(const Point &point);
  ~Point();

  int getX() const { return _x; }
  int getY() const { return _y; }
  void move(int newX, int newY) { _x = newX; _y = newY; }
 
 private:
  int _x, _y;
};

#endif