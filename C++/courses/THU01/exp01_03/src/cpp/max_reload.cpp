#include "max_reload.h"

#include <cmath>

using namespace std;

int max_reload(int x, int y) {
  if (x == y) {
    return x;
  } else if (x > y) {
    return x;
  } else {
    return y;
  }
}

int max_reload(int x, int y, int z) {
  return max_reload(max_reload(x,y),z);
}

double max_reload(double x, double y) {
  if (abs(x - y) < 1e-10) {
    return x;
  } else if (x > y) {
    return x;
  } else {
    return y;
  }
}

double max_reload(double x, double y, double z) {
  return max_reload(max_reload(x,y),z);
}