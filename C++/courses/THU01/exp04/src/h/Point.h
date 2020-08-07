#ifndef EXP04_POINT_H_
#define EXP04_POINT_H_

class Point{
 public:
  Point(int xx = 0, int yy = 0) { x = xx; y = yy; }
  Point(const Point &p);
  ~Point();

  int getX() const { return x; }
  int getY() const { return y; }

  void setX(int xx) { x = xx; }
  void setY(int yy) { y = yy; }

  void setCoordinate(int xx, int yy);
  void showCoordinate();

 private:  
  int x, y;
};

#endif